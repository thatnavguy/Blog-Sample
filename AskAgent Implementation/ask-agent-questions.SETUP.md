# Ask Agent Questions — Setup & Portability Guide

This guide explains how to add the **Ask Agent Questions** workflow to another
repository, including a repository in a different GitHub organisation.

Follow it from top to bottom. The workflow can read issue discussions and
repository files, then post one answer to the triggering issue. It does not
change source code, issue fields, labels, or repository settings.

---

## 1. What this workflow does

The workflow uses GitHub Agentic Workflows (`gh-aw`) and GitHub Copilot to answer
questions about the repository.

It can be triggered in two ways:

- Add the `agent:ask` label to an issue. The workflow removes that label when it
  handles the request.
- Comment `/ask <question>` on an issue or in an issue comment thread.

The agent reads the issue title, body, and comments, then inspects relevant files
in the checked-out repository. It should answer concisely, cite repository paths
and line numbers where useful, and say when the repository does not provide
enough evidence. It can publish at most one consolidated comment; if there is no
meaningful answer, it can choose not to publish one.

This is an advisory Q&A workflow, not a code-writing workflow. Its prompt treats
issue content as untrusted input and forbids using it to expand permissions or
change repository content.

Like other `gh-aw` workflows, the Markdown file is the source and the lock file
is generated:

| File | Purpose | Edit? |
| --- | --- | --- |
| `ask-agent-questions.md` | Human-readable workflow source and agent instructions. | Yes |
| `ask-agent-questions.lock.yml` | Compiled GitHub Actions workflow. | No; regenerate it with `gh aw compile`. |

> **Golden rule:** edit the `.md`, compile it, and commit both files. Do not
> hand-edit the `.lock.yml`.

---

## 2. Prerequisites

### 2.1 Tools

- **GitHub CLI** (`gh`), installed and authenticated.
  - Check: `gh auth status`
  - Sign in if needed: `gh auth login`
- **gh-aw extension**, installed and up to date.
  - Check: `gh aw version`
  - Install using the instructions in the official
    [gh-aw repository](https://github.com/github/gh-aw).
  - Upgrade an existing installation: `gh extension upgrade aw`

This workflow has no PowerShell script or BCQuality knowledge-index build step.

### 2.2 Copilot access and billing

The workflow declares `copilot-requests: write` and uses the Copilot engine. The
repository owner must have a valid way to pay for Copilot inference. Confirm the
billing arrangement with the organisation or repository administrator before
installing it.

The exact available authentication and billing options depend on the GitHub
account and organisation configuration. Use the current
[gh-aw authentication documentation](https://github.github.com/gh-aw/reference/auth/)
and confirm that the chosen method is supported for this repository. Do not
assume a personal access token or a particular billing arrangement is required
without checking current gh-aw guidance.

### 2.3 Repository and issue access

The workflow is configured with:

- `contents: read` so the agent can inspect the repository.
- `issues: read` so it can read the triggering issue and its comments.
- `copilot-requests: write` for Copilot inference.
- The `github` tool's `issues` toolset for issue context.
- Safe outputs limited to one issue comment, plus one `noop` outcome.

Review the target organisation's Actions policy and workflow permission policy.
They must allow this workflow and its declared permissions. The agent's ability
to read repository files is limited by the checkout and token permissions; do not
add broader permissions unless the workflow genuinely needs them.

---

## 3. The workflow source, explained

The supplied `ask-agent-questions.md` includes these important settings:

```yaml
on:
  roles: [admin, maintainer, write, triage, read]
  label_command:
    name: agent:ask
    events: [issues]
    remove_label: true
  slash_command:
    name: ask
    events: [issues, issue_comment]

permissions:
  contents: read
  issues: read
  copilot-requests: write

engine: copilot
model: haiku
network: defaults

tools:
  github:
    mode: gh-proxy
    toolsets: [issues]

safe-outputs:
  report-failure-as-issue: false
  add-comment:
    max: 1
    hide-older-comments: true
  noop:
    max: 1
```

The role list controls who may invoke the workflow. The label and slash-command
triggers are independent ways to ask a question. Adjust them to match the
repository's moderation and access policy; do not broaden access casually.

The `safe-outputs` configuration limits the workflow to one answer comment and
allows a no-op. `hide-older-comments` keeps reruns from leaving multiple visible
answers. The prompt also explicitly tells the agent to use the `safeoutputs`
CLI and not an issue-writing tool or `gh` command.

There is no top-level custom `steps:` block in this source. The workflow relies
on gh-aw's normal checkout behavior; it does not need a manually added checkout
step or a separate knowledge-base checkout. If you add custom steps later,
re-check gh-aw's checkout documentation and compile the workflow again.

---

## 4. Add it to another repository

Do this from a clone of the target repository.

1. Confirm the target repository can use Copilot inference and that its workflow
   policy permits the declared permissions.

2. Make sure `.github/workflows` exists:
   ```bash
   mkdir -p .github/workflows
   ```

3. Copy the source file into the target repository:
   ```text
   .github/workflows/ask-agent-questions.md
   ```
   You may also copy this setup guide alongside it for maintainers.

4. Review the source before compiling. At minimum, decide:
   - Which roles may invoke the workflow.
   - Whether to keep both the `agent:ask` label and `/ask` slash command.
   - Whether the prompt's Business Central and AL expertise matches the target
     repository. Update it if the repository has a different domain.
   - Whether issue content should be allowed to cite only repository evidence,
     as it is currently written. The current prompt prohibits external sources.

5. Compile from the root of the target repository:
   ```bash
   gh aw compile ask-agent-questions
   ```
   Confirm compilation completes with zero errors and warnings. The generated
   file should be:
   ```text
   .github/workflows/ask-agent-questions.lock.yml
   ```

6. Commit both workflow files on a branch and open a pull request:
   ```bash
   git checkout -b chore/add-ask-agent-questions
   git add .github/workflows/ask-agent-questions.md .github/workflows/ask-agent-questions.lock.yml
   git commit -m "Add Ask Agent Questions workflow"
   git push -u origin chore/add-ask-agent-questions
   gh pr create --fill
   ```

7. Merge the pull request to the default branch. Issue-triggered workflows
   generally need to be present on the repository's default branch to run
   reliably.

8. Test both supported entry points on a test issue: apply the `agent:ask`
   label, and separately add a `/ask` comment. Confirm each run reads relevant
   repository evidence and posts no more than one answer.

---

## 5. Add it to a different organisation

Complete Section 4, and also confirm the following with the new organisation's
administrators:

1. **Copilot inference is available and billable** for the repository. Check the
   organisation's Copilot plan and gh-aw's current authentication guidance.

2. **GitHub Actions policy allows the workflow.** If the organisation uses an
   action allow-list, make sure the actions used by the compiled workflow are
   permitted. The compiled workflow, rather than this source file alone, is the
   authoritative list of actions to check.

3. **Workflow permissions are allowed.** The source requests `contents: read`,
   `issues: read`, and `copilot-requests: write`. Organisation or repository
   policy must allow the required permissions. The safe-output comment mechanism
   must also be permitted by the compiled workflow and gh-aw configuration.

4. **Issue participation policy matches the role list.** This workflow includes
   `read` among the configured roles. If the new repository should accept
   questions only from trusted contributors, narrow the list before merging.

5. Copy, compile, commit, merge, and test the workflow as described in Section 4.

---

## 6. Run and monitor it

- **Label trigger:** apply `agent:ask` to an issue.
- **Slash trigger:** comment `/ask <your question>` on an issue or issue
  comment thread.
- **List recent runs:**
  ```bash
  gh run list --repo OWNER/REPO --workflow "Ask Agent Questions"
  ```
- **Inspect a run:**
  ```bash
  gh run view RUN_ID --repo OWNER/REPO
  ```
- **Show failed-step logs:**
  ```bash
  gh run view RUN_ID --repo OWNER/REPO --log-failed
  ```
- **Watch a run:**
  ```bash
  gh run watch RUN_ID --repo OWNER/REPO
  ```
- **Audit with gh-aw:**
  ```bash
  gh aw audit RUN_ID
  ```

---

## 7. Troubleshooting

| Symptom | Likely cause | What to check |
| --- | --- | --- |
| No workflow run after adding the label | The label name does not match `agent:ask`, the event is unsupported by the installed gh-aw version, or the workflow is not on the default branch. | Check the source trigger, repository default branch, and Actions tab. |
| No run after posting `/ask` | The command syntax, event, or role authorization does not match the workflow configuration. | Use `/ask` followed by a question in an issue or issue comment, and check the configured roles and run logs. |
| Copilot inference fails or is denied | Copilot inference is unavailable for the repository, billing is not configured, or the selected authentication method is unsupported. | Check organisation/repository Copilot access and the current gh-aw authentication guide. |
| The agent cannot inspect files | Checkout or contents permissions are missing or restricted by policy. | Confirm `contents: read` is present and allowed. |
| The agent cannot read the issue | Issue access is missing or restricted. | Confirm `issues: read` and the GitHub `issues` toolset are present and allowed. |
| The answer is not posted | The run may have selected `noop`, failed before safe output, or the safe-output configuration/policy may prevent commenting. | Inspect the run logs and compiled workflow; confirm `add-comment` is enabled. |
| Compilation reports the lock file is out of date | The Markdown source and generated workflow differ. | Run `gh aw compile ask-agent-questions` from the repository root and commit both files. |
| Workflow does not compile in the target repository | The local gh-aw version may differ or a source setting may not be supported. | Check `gh aw version`, update gh-aw, and consult its current documentation. |

### After any change to the source

1. Run `gh aw compile ask-agent-questions` from the repository root.
2. Confirm there are no compilation errors or warnings.
3. Commit both `ask-agent-questions.md` and
   `ask-agent-questions.lock.yml`.

---

## 8. Quick checklist

```text
[ ] Target repository has Copilot inference access and billing configured
[ ] GitHub CLI is installed and authenticated (gh auth status)
[ ] gh-aw is installed and current (gh aw version)
[ ] Source copied to .github/workflows/ask-agent-questions.md
[ ] Trigger roles and label/slash-command behavior reviewed
[ ] contents: read, issues: read, and copilot-requests: write are allowed
[ ] Compiled with: gh aw compile ask-agent-questions
[ ] Compilation completed with zero errors and warnings
[ ] Both .md and .lock.yml committed
[ ] Workflow merged to the default branch
[ ] Tested label and slash-command triggers on an issue
[ ] Confirmed the run posts at most one answer comment
```

---

## 9. Reference links

- [gh-aw authentication](https://github.github.com/gh-aw/reference/auth/)
- [gh-aw checkout behavior](https://github.github.com/gh-aw/reference/checkout/)
- [GitHub Agentic Workflows](https://github.com/github/gh-aw)
