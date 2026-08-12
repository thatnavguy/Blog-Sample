# BCQuality AL Review — Setup & Portability Guide

This guide explains how to add the **BCQuality AL Review** agentic workflow to a
different repository, or to a repository in a different GitHub organisation.

It is written so that **a person or an AI agent can follow it step by step**. Read
it from top to bottom. Do not skip the "Prerequisites" or "Troubleshooting"
sections — every error listed there is one we actually hit while getting this
workflow to run.

---

## 1. What this workflow does

When someone opens or updates a pull request that changes any `.al` file, this
workflow:

1. Checks out the pull request code.
2. Downloads the public Microsoft **BCQuality** knowledge base into a folder
   called `.bcquality`.
3. Runs the GitHub Copilot coding agent to review the changed AL files against
   that knowledge base.
4. Posts **one** advisory review comment on the pull request with its findings.

It is **advisory only**. It does not block merges and it does not change code.

It is built with **GitHub Agentic Workflows** (`gh-aw`). That means there are two
files that always travel together:

| File | What it is | Do you edit it? |
| --- | --- | --- |
| `bcquality-al-review.md` | The **source**. Human-readable. You edit this. | ✅ Yes |
| `bcquality-al-review.lock.yml` | The **compiled** GitHub Actions workflow that actually runs. Generated from the `.md`. | ❌ No — it is generated |

> **Golden rule:** never hand-edit the `.lock.yml`. Edit the `.md`, then run
> `gh aw compile`, then commit **both** files. If they drift apart, the workflow
> fails a built-in "lock file" check.

---

## 2. Prerequisites

Before you start, make sure you have all of the following.

### 2.1 Tools on your machine

- **GitHub CLI** (`gh`) — installed and logged in.
  - Check: `gh auth status`
  - If not logged in: `gh auth login`
- **gh-aw extension** (the agentic-workflows compiler).
  - Check: `gh aw version`
  - If missing, install it:
    ```bash
    curl -sL https://raw.githubusercontent.com/github/gh-aw/main/install-gh-aw.sh | bash
    ```
  - If already installed, upgrade it: `gh extension upgrade aw`
- **PowerShell** — the BCQuality index-build step uses `pwsh`. GitHub-hosted
  Ubuntu runners already have it, so you only need it locally if you want to test
  scripts.

### 2.2 Access and billing (the important one)

This workflow uses **GitHub Copilot** as its AI engine. Copilot inference must be
paid for. There are two ways, and you must pick one **before** the workflow will
run:

- **Option A — Organisation billing (recommended).**
  The workflow uses `permissions: copilot-requests: write`. This makes the
  workflow use the built-in `GITHUB_TOKEN`, and the cost is billed to the
  organisation's Copilot plan. **No secret or personal token is needed.**
  - Requirement: the target **organisation must have a GitHub Copilot
    subscription with centralised billing enabled**. Ask the org admin to confirm
    this.
  - This is the recommended setup for organisation-owned repositories.

- **Option B — A single user's Personal Access Token (PAT).**
  Use this only if the org does **not** have centralised Copilot billing (for
  example, a personal repository). One named user creates a fine-grained PAT and
  it is stored as a repository secret called `COPILOT_GITHUB_TOKEN`.
  - The token owner must have an active Copilot licence.
  - The token must be a **fine-grained PAT** with **Account → Copilot Requests:
    Read**. OAuth tokens (starting with `gho_`) are rejected.
  - Create one here (pre-filled):
    <https://github.com/settings/personal-access-tokens/new?name=COPILOT_GITHUB_TOKEN&user_copilot_requests=read>
  - Store it: `gh aw secrets set COPILOT_GITHUB_TOKEN --value "<the-pat>" --repo OWNER/REPO`
  - All the billing goes to **that one user**, no matter who opened the PR. There
    is **no** way to bill each contributor's personal Copilot quota automatically.

> If you are moving to a **different organisation**, this billing check is the
> single most common reason the workflow fails. Sort it out first.

---

## 3. The workflow file, explained

Below is the working `bcquality-al-review.md` frontmatter with an explanation of
every part. When you copy it to a new repo, this is what you may need to change.

```yaml
---
name: BCQuality AL Review
description: Advisory AL code review of pull requests using the Microsoft BCQuality knowledge base.
on:
  pull_request:
    paths:
      - "**/*.al"          # Only runs when a PR changes an .al file.

permissions:
  contents: read           # (1) Lets the agent check out the repository code.
  pull-requests: read      # (2) Lets the agent read the PR.
  copilot-requests: write  # (3) Bills Copilot inference to the org plan (Option A).

engine: copilot            # Use the GitHub Copilot coding agent.
network: defaults          # Standard network allow-list.
timeout-minutes: 25        # Give the agent up to 25 minutes.

steps:
  - name: Checkout repository          # (4) MUST be first. See "gotchas" below.
    uses: actions/checkout@v7.0.1
    with:
      fetch-depth: 0                   # Full history so it can diff against the base branch.
      persist-credentials: false
  - name: Checkout BCQuality knowledge base
    uses: actions/checkout@v7.0.1
    with:
      repository: microsoft/BCQuality  # Public repo — no token needed.
      ref: main
      path: .bcquality                 # Goes into a sub-folder, not the root.
      persist-credentials: false
  - name: Build BCQuality knowledge index (best effort)
    working-directory: .bcquality
    continue-on-error: true            # If the index build fails, keep going.
    shell: pwsh
    run: ./tools/Build-KnowledgeIndex.ps1

tools:
  github:
    mode: gh-proxy
    toolsets: [pull_requests]          # The agent can read PR data.
  bash:                                # The agent may only run these read-only commands.
    - "cat:*"
    - "ls:*"
    - "grep:*"
    - "find:*"
    - "head:*"
    - "tail:*"
    - "wc:*"

safe-outputs:
  add-comment:
    max: 1                             # Post at most one comment.
    hide-older-comments: true          # Hide its previous comments on re-runs.
---
```

Below the `---` there is a `<steps>` / `<prompt>` body that tells the agent
**what** to review and how to phrase its findings. You normally keep that as-is.

### Three "gotchas" this file already solves

These were real failures. The file above already fixes them; keep them fixed when
you copy it.

1. **Copilot needs paid access** → the `copilot-requests: write` permission
   (Option A) or the `COPILOT_GITHUB_TOKEN` secret (Option B).
   *If missing:* the run fails early with
   `None of the following secrets are set: COPILOT_GITHUB_TOKEN`.

2. **Custom `steps:` turn off the automatic checkout** → so we add an explicit
   `Checkout repository` step **first**. When you define your own top-level
   `steps:`, gh-aw stops adding its own checkout, and the `checkout:` frontmatter
   key is ignored.
   *If missing:* the "Configure Git credentials" step fails with
   `fatal: not a git repository ... exit code 128`.

3. **The checkout needs `contents: read`** → gh-aw only grants that automatically
   for its own built-in checkout, not for a manual one.
   *If missing:* checkout fails with
   `fatal: repository '...' not found ... exit code 128` on private repos.

---

## 4. Steps to add it to another repository (same organisation)

Do this from a clone of the **target** repository on your machine.

1. **Confirm Copilot billing** for the org (see Section 2.2, Option A). If the org
   does not have it, follow Option B instead.

2. **Create the workflows folder** if it does not exist:
   ```bash
   mkdir -p .github/workflows
   ```

3. **Copy the two source files** from this repo into the target repo:
   - `.github/workflows/bcquality-al-review.md`
   - `.github/workflows/bcquality-al-review.SETUP.md` (this guide — optional but helpful)

   > Do **not** copy the `.lock.yml` by hand. You will generate a fresh one in
   > step 5.

4. **Adjust the file if needed** (usually nothing):
   - You can reword the `description`, but the knowledge base itself is
     Microsoft's public `microsoft/BCQuality`, so leave the `repository:` value
     alone.
   - If the target repo reviews something other than AL, change the `paths:` glob
     and the prompt. For AL repos, leave it as `"**/*.al"`.

5. **Compile** to generate the lock file. Run this from the **root of the target
   repo** (not from inside `.github/workflows`):
   ```bash
   gh aw compile bcquality-al-review
   ```
   You want to see: `Compiled 1 workflow(s): 0 error(s), 0 warning(s)`.

6. **Commit both files** on a branch and open a pull request:
   ```bash
   git checkout -b chore/add-bcquality-al-review
   git add .github/workflows/bcquality-al-review.md .github/workflows/bcquality-al-review.lock.yml
   git commit -m "Add BCQuality AL Review agentic workflow"
   git push -u origin chore/add-bcquality-al-review
   gh pr create --fill
   ```

7. **Merge to the default branch.**
   Because the workflow triggers on `pull_request`, GitHub runs the copy of the
   workflow that lives on the **base branch** (usually `main`). It only takes full
   effect once it is merged into the default branch.

8. **Test it.** Open a small test PR that changes any `.al` file and confirm a
   single "BCQuality AL Review" comment appears. See Section 6 for how to watch
   the run.

---

## 5. Steps to add it to a different organisation

Everything in Section 4 applies, **plus** these extra checks. Cross-org moves fail
most often on billing and permissions, so go slowly here.

1. **Billing must exist in the *new* org.**
   `copilot-requests: write` bills the **organisation that owns the repository**.
   The new org needs its own Copilot subscription with centralised billing. If it
   does not have one, you must use **Option B** (a `COPILOT_GITHUB_TOKEN` secret)
   instead — see Section 2.2.

2. **Organisation Actions policy must allow the workflow to run.**
   Some orgs restrict which actions are allowed. Check:
   - Org → Settings → Actions → General → "Allow ... actions".
   - This workflow uses `actions/checkout`, `actions/download-artifact`,
     `actions/github-script`, and `actions/cache`. All are first-party GitHub
     actions. If the org uses an allow-list, make sure GitHub-authored actions are
     permitted.

3. **`GITHUB_TOKEN` default permissions must not be locked down too far.**
   - Org/repo → Settings → Actions → General → "Workflow permissions".
   - The workflow declares exactly the permissions it needs
     (`contents: read`, `pull-requests: read`, `copilot-requests: write`). If the
     org forces "read-only" and blocks elevation, the `copilot-requests: write`
     and `pull-requests: write` (for commenting) parts will not work. Allow
     workflows to request the permissions they declare.

4. **Copy, compile, commit, merge** exactly as in Section 4, steps 2–8, into the
   new org's repository.

5. **If the new org is private and on GitHub Enterprise (GHEC/GHES)**, Copilot
   inference may need a custom endpoint. This is uncommon; only pursue it if you
   see `400 Bad Request` errors at the inference step. See the gh-aw engine docs
   under "Enterprise API Endpoint" if so.

---

## 6. How to run and watch it

- **Trigger:** open or update a PR that changes at least one `.al` file.
- **Watch the run live:**
  ```bash
  gh run watch --repo OWNER/REPO
  ```
- **List recent runs:**
  ```bash
  gh run list --repo OWNER/REPO --workflow "BCQuality AL Review"
  ```
- **Inspect a specific run (jobs and steps):**
  ```bash
  gh run view <RUN_ID> --repo OWNER/REPO
  ```
- **See only what failed:**
  ```bash
  gh run view <RUN_ID> --repo OWNER/REPO --log-failed
  ```
- **Audit a run the gh-aw way (best for agent debugging):**
  ```bash
  gh aw audit <RUN_ID>
  ```

---

## 7. Troubleshooting

Match the error message you see to the row below. These are the exact failures we
resolved for this workflow.

| Symptom (in the failed step) | Cause | Fix |
| --- | --- | --- |
| `None of the following secrets are set: COPILOT_GITHUB_TOKEN` (step: *Validate COPILOT_GITHUB_TOKEN secret*) | No Copilot auth configured. | Add `copilot-requests: write` to `permissions:` (Option A) **or** set the `COPILOT_GITHUB_TOKEN` secret (Option B). Recompile. |
| `fatal: not a git repository ... exit code 128` (step: *Configure Git credentials*) | Custom `steps:` suppressed the default checkout, so there is no `.git` at the workspace root. | Add an explicit `Checkout repository` step as the **first** entry under `steps:`. Recompile. |
| `fatal: repository '...' not found ... exit code 128` (step: *Checkout repository*) | The agent job's token lacks `contents: read`, so it cannot clone a private repo. | Add `contents: read` to `permissions:`. Recompile. |
| `403` or inference failure with `copilot-requests: write` | The org has no Copilot subscription / centralised billing, or the token has no Copilot access. | Enable centralised Copilot billing on the org, **or** switch to Option B (`COPILOT_GITHUB_TOKEN`). |
| A "lock file out of date" / compile-version check fails | The `.md` was edited but `.lock.yml` was not regenerated (they drifted). | Run `gh aw compile bcquality-al-review` from the repo root and commit both files. |
| The workflow never triggers on a PR | The PR did not change any `.al` file, or the workflow is not on the default branch yet. | Change an `.al` file in the PR, and make sure the workflow is merged to the default branch. |
| Actions won't start at all in a new org | Org Actions policy blocks the actions or workflow permissions. | Allow GitHub-authored actions and permit declared workflow permissions (Section 5, steps 2–3). |

### After ANY change to the `.md`

Always do these three things, in order:

1. `gh aw compile bcquality-al-review` (from the repo root).
2. Confirm `0 error(s), 0 warning(s)`.
3. Commit **both** `bcquality-al-review.md` and `bcquality-al-review.lock.yml`.

---

## 8. Quick copy-paste checklist

```text
[ ] Target org has Copilot centralised billing (Option A)  — OR  COPILOT_GITHUB_TOKEN secret set (Option B)
[ ] gh CLI installed and logged in         (gh auth status)
[ ] gh-aw extension installed              (gh aw version)
[ ] Copied bcquality-al-review.md into target repo .github/workflows/
[ ] permissions: has contents: read + pull-requests: read + copilot-requests: write
[ ] steps: starts with an explicit "Checkout repository" step
[ ] Ran: gh aw compile bcquality-al-review   -> 0 errors, 0 warnings
[ ] Committed BOTH .md and .lock.yml
[ ] Merged to the default branch
[ ] Opened a test PR that edits an .al file and saw one review comment
```

---

## 9. Reference links

- gh-aw authentication (Copilot billing options):
  <https://github.github.com/gh-aw/reference/auth/>
- gh-aw engines (Copilot engine details):
  <https://github.github.com/gh-aw/reference/engines/>
- gh-aw checkout behaviour:
  <https://github.github.com/gh-aw/reference/checkout/>
- Microsoft BCQuality knowledge base:
  <https://github.com/microsoft/BCQuality>
- Debugging agentic workflows:
  <https://raw.githubusercontent.com/github/gh-aw/main/debug.md>
