page 60061 "Test Duration_TNG"
{
    Caption = 'Test Duration';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
        }
    }

    actions
    {
        area(Processing)
        {
            group(CalculateDuration)
            {
                Caption = 'Calculate Duration';
                action(CalculateDurationDateTime)
                {
                    ApplicationArea = All;
                    Caption = 'DateTime 2 - DateTime 1';
                    ToolTip = 'Calculate duration between datetimes.';
                    Image = Calculate;

                    trigger OnAction()
                    begin
                        CalcDurationDateTime();
                    end;
                }
                action(CalculateDurationDate)
                {
                    ApplicationArea = All;
                    Caption = 'Date 2 - Date 1';
                    ToolTip = 'Calculate duration between dates.';
                    Image = Calculate;

                    trigger OnAction()
                    begin
                        CalcDurationDate();
                    end;
                }
                action(CalculateDurationTime)
                {
                    ApplicationArea = All;
                    Caption = 'Time 2 - Time 1';
                    ToolTip = 'Calculate duration between times.';
                    Image = Calculate;

                    trigger OnAction()
                    begin
                        CalcDurationTime();
                    end;
                }
            }
        }
    }

    local procedure CalcDurationDateTime()
    var
        MyDuration: Duration;
        DateTime1: DateTime;
        DateTime2: DateTime;
    begin
        DateTime1 := CreateDateTime(20200101D, 010000T); // 01 January 2020 at 01:00:00 AM
        DateTime2 := CreateDateTime(20200115D, 053001T); // 15 January 2020 at 05:30:01 AM
        MyDuration := DateTime2 - DateTime1;
        Message('%1', MyDuration);
        Message('%1 milliseconds', MyDuration / 1);
        Message('%1 hours.', MyDuration / 3600000)
    end;

    local procedure CalcDurationDate()
    var
        MyDuration: Duration;
        Date1: Date;
        Date2: Date;
    begin
        Date1 := 20200101D; // 01 January 2020
        Date2 := 20200115D; // 15 January 2020
        MyDuration := Date2 - Date1;
        Message('%1. \ Numerical Value %2.', MyDuration, MyDuration / 1);
    end;

    local procedure CalcDurationTime()
    var
        MyDuration: Duration;
        Time1: Time;
        Time2: Time;
    begin
        Time1 := 010000T; // 01:00:00 AM
        Time2 := 053001T; // 05:30:01 AM
        MyDuration := Time2 - Time1;
        Message('%1. \ Numerical Value %2.', MyDuration, MyDuration / 1);
    end;
}
