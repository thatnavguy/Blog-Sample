page 60111 "Test CalcDate with Calendar"
{
    ApplicationArea = All;
    Caption = 'Test CalcDate with Calendar';
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(fldInputDate; InputDate)
                {
                    ApplicationArea = All;
                    Caption = 'Input Date';
                    ToolTip = 'Input Date';
                }
                field(fldInputDateFormula; InputDateFormula)
                {
                    ApplicationArea = All;
                    Caption = 'Input Date Formula';
                    ToolTip = 'Input Date Formula';
                }
                field(fldMyCalendar; MyCalendar)
                {
                    ApplicationArea = All;
                    Caption = 'My Calendar';
                    ToolTip = 'My Calendar';
                    TableRelation = "Base Calendar".Code;
                }
                field(fldMyOtherCalendar; MyOtherCalendar)
                {
                    ApplicationArea = All;
                    Caption = 'My Other Calendar';
                    ToolTip = 'My Other Calendar';
                    TableRelation = "Base Calendar".Code;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(CalculateNewDate)
            {
                Caption = 'Calculate New Date';
                action(UseCompanyInfoCalendar)
                {
                    ApplicationArea = All;
                    Caption = 'Using Company Information Calendar';
                    ToolTip = 'Calculate New Date based on Company Information Calendar';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = CalculateCalendar;
                    trigger OnAction()
                    var
                        NewDate: Date;
                    begin
                        NewDate := GetNewDateBasedOnWorkingDays(Enum::"Calendar Source Type"::Company, '', InputDate, InputDateFormula);
                        Message('New Date: %1', NewDate);
                    end;
                }
                action(UseMyCalendar)
                {
                    ApplicationArea = All;
                    Caption = 'Using My Calendar';
                    ToolTip = 'Calculate New Date based on My Calendar';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = CalculateCalendar;
                    trigger OnAction()
                    var
                        NewDate: Date;
                    begin
                        NewDate := GetNewDateBasedOnWorkingDays(Enum::"Calendar Source Type"::"My Calendar_TNG", MyCalendar, InputDate, InputDateFormula);
                        Message('New Date: %1', NewDate);
                    end;
                }
                action(UseTwoCalendar)
                {
                    ApplicationArea = All;
                    Caption = 'Using Two Calendars';
                    ToolTip = 'Calculate New Date based on My Calendar and My Other Calendar';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = CalculateCalendar;
                    trigger OnAction()
                    var
                        NewDate: Date;
                    begin
                        NewDate := GetNewDateBasedOnWorkingDaysOnTwoCalendars(Enum::"Calendar Source Type"::"My Calendar_TNG", MyCalendar, MyOtherCalendar, InputDate, InputDateFormula);
                        Message('New Date: %1', NewDate);
                    end;
                }
            }
        }
    }

    var
        InputDateFormula: DateFormula;
        InputDate: Date;
        MyCalendar: Code[10];
        MyOtherCalendar: Code[10];

    procedure GetNewDateBasedOnWorkingDays(CalendarSourceType: Enum "Calendar Source Type"; BaseCalendarCode: Code[10]; CurrDate: Date; CurrDateFormula: DateFormula): Date
    var
        CustomizedCalendarChange: array[2] of Record "Customized Calendar Change";
        CalendarManagement: Codeunit "Calendar Management";
    begin
        CustomizedCalendarChange[1].SetSource(CalendarSourceType, '', '', BaseCalendarCode);
        exit(CalendarManagement.CalcDateBOC(Format(CurrDateFormula), CurrDate, CustomizedCalendarChange, false));
    end;

    procedure GetNewDateBasedOnWorkingDaysOnTwoCalendars(CalendarSourceType: Enum "Calendar Source Type"; BaseCalendarCode: Code[10]; BaseCalendarCode2: Code[10]; CurrDate: Date; CurrDateFormula: DateFormula): Date
    var
        CustomizedCalendarChange: array[2] of Record "Customized Calendar Change";
        CalendarManagement: Codeunit "Calendar Management";
    begin
        CustomizedCalendarChange[1].SetSource(CalendarSourceType, '', '', BaseCalendarCode);
        CustomizedCalendarChange[2].SetSource(CalendarSourceType, '', '', BaseCalendarCode2);
        exit(CalendarManagement.CalcDateBOC(Format(CurrDateFormula), CurrDate, CustomizedCalendarChange, true));
    end;

    procedure GetNewDateBasedOnWorkingDaysFromCompanyInfo(CurrDate: Date; CurrDateFormula: DateFormula): Date
    var
        CustomizedCalendarChange: array[2] of Record "Customized Calendar Change";
        CalendarManagement: Codeunit "Calendar Management";
    begin
        CustomizedCalendarChange[1].SetSource(Enum::"Calendar Source Type"::Company, '', '', ''); //Setup source as Company Information
        exit(CalendarManagement.CalcDateBOC(Format(CurrDateFormula), CurrDate, CustomizedCalendarChange, false));
    end;

    procedure GetNewDateBasedOnWorkingDaysFromMonWedCalendar(CurrDate: Date; CurrDateFormula: DateFormula): Date
    var
        CustomizedCalendarChange: array[2] of Record "Customized Calendar Change";
        CalendarManagement: Codeunit "Calendar Management";
    begin
        CustomizedCalendarChange[1].SetSource(Enum::"Calendar Source Type"::"My Calendar_TNG", '', '', 'MONWED'); // Using MONWED base calendar
        exit(CalendarManagement.CalcDateBOC(Format(CurrDateFormula), CurrDate, CustomizedCalendarChange, false));
    end;

    procedure GetNewDateBasedOnWorkingDaysFromTwoCalendars(CurrDate: Date; CurrDateFormula: DateFormula): Date
    var
        CustomizedCalendarChange: array[2] of Record "Customized Calendar Change";
        CalendarManagement: Codeunit "Calendar Management";
    begin
        CustomizedCalendarChange[1].SetSource(Enum::"Calendar Source Type"::"My Calendar_TNG", '', '', 'MONWED'); // Using MONWED base calendar
        CustomizedCalendarChange[2].SetSource(Enum::"Calendar Source Type"::"My Calendar_TNG", '', '', 'WEDFRI'); // Using WEDFRI base calendar
        exit(CalendarManagement.CalcDateBOC(Format(CurrDateFormula), CurrDate, CustomizedCalendarChange, true));
    end;



}
