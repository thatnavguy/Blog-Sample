page 60031 "Lazy Evaluator_TNG"
{
    Caption = 'Lazy Evaluator';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActTestEvaluation)
            {
                ApplicationArea = All;
                Caption = 'Test Evaluation';
                ToolTip = 'Test Evaluation.';
                Image = Process;

                trigger OnAction()
                begin
                    TestEvaluation();
                end;
            }

            action(ActTestIfEvaluation)
            {
                ApplicationArea = All;
                Caption = 'Test If Evaluation';
                ToolTip = 'Test If Evaluation.';
                Image = Process;

                trigger OnAction()
                begin
                    TestIfEvaluation();
                end;
            }

            action(ActTestCaseEvaluation)
            {
                ApplicationArea = All;
                Caption = 'Test Case Evaluation';
                ToolTip = 'Test Case Evaluation.';
                Image = Process;

                trigger OnAction()
                begin
                    TestCaseEvaluation();
                end;
            }
        }
    }

    local procedure TestEvaluation()
    var
        StartDateTime: DateTime;
        EndDateTime: DateTime;
        TimeDuration: Duration;
    begin
        StartDateTime := CurrentDateTime();
        if FastProcessButFalse() and SlowProcessButTrue() then
            Message('OK');

        EndDateTime := CurrentDateTime();
        TimeDuration := EndDateTime - StartDateTime;
        Message('%1', TimeDuration);
    end;

    local procedure TestIfEvaluation()
    var
        StartDateTime: DateTime;
        EndDateTime: DateTime;
        TimeDuration: Duration;
    begin
        StartDateTime := CurrentDateTime();

        if CheckIfConditions() then
            Message('OK');

        EndDateTime := CurrentDateTime();
        TimeDuration := EndDateTime - StartDateTime;
        Message('%1', TimeDuration);
    end;

    local procedure CheckIfConditions(): Boolean
    begin
        if not FastProcessButFalse() then
            exit(false);

        if not SlowProcessButTrue() then
            exit(false);

        exit(true);
    end;

    local procedure TestCaseEvaluation()
    var
        StartDateTime: DateTime;
        EndDateTime: DateTime;
        TimeDuration: Duration;
    begin
        StartDateTime := CurrentDateTime();

        if CheckCaseConditions() then
            Message('OK');

        EndDateTime := CurrentDateTime();
        TimeDuration := EndDateTime - StartDateTime;
        Message('%1', TimeDuration);
    end;

    local procedure CheckCaseConditions(): Boolean
    begin
        case false of
            FastProcessButFalse(),
            SlowProcessButTrue():
                exit(false);
        end;
        exit(true);
    end;

    local procedure FastProcessButFalse(): Boolean
    begin
        Sleep(1000); // 1 second
        exit(false);
    end;

    local procedure SlowProcessButTrue(): Boolean
    begin
        Sleep(5000); // 5 seconds
        exit(true);
    end;
}
