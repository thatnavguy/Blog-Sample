page 60211 "Check Blank Date Formula"
{
    ApplicationArea = All;
    Caption = 'Check Blank Date Formula';
    PageType = Card;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            field(MyDateFormula; MyDateFormula)
            {
                ApplicationArea = All;
                Caption = 'Date Formula';
                ToolTip = 'Enter a date formula';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CheckBlankDateFormulaFormat)
            {
                ApplicationArea = All;
                Caption = 'Check Blank Date Formula using Format';
                ToolTip = 'Check Blank Date Formula using Format method';
                Image = CheckList;
                trigger OnAction()
                begin
                    CheckBlankDateFormulaUsingFormat(MyDateFormula);
                end;
            }
            action(CheckBlankDateFormulaVariable)
            {
                ApplicationArea = All;
                Caption = 'Check Blank Date Formula using Variable';
                ToolTip = 'Check Blank Date Formula using Variable';
                Image = CheckList;
                trigger OnAction()
                begin
                    CheckBlankDateFormulaUsingVariable(MyDateFormula);
                end;
            }
            action(CheckBlankDateFormulaTestField)
            {
                ApplicationArea = All;
                Caption = 'Check Blank Date Formula using TestField';
                ToolTip = 'Check Blank Date Formula using TestField';
                Image = CheckList;
                trigger OnAction()
                begin
                    CheckBlankDateFormulaUsingTestField();
                end;
            }
        }
    }

    var
        MyDateFormula: DateFormula;

    procedure CheckBlankDateFormulaUsingFormat(InputDateFormula: DateFormula)
    begin
        if Format(InputDateFormula) = '' then
            Error('Date Formula cannot be blank');
    end;

    procedure CheckBlankDateFormulaUsingVariable(InputDateFormula: DateFormula)
    var
        BlankDateFormula: DateFormula;
    begin
        if InputDateFormula = BlankDateFormula then
            Error('Date Formula cannot be blank');
    end;

    procedure CheckBlankDateFormulaUsingTestField()
    var
        Item: Record Item;
    begin
        Item.TestField("Lead Time Calculation");
    end;
}
