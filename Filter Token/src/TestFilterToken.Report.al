report 60701 TestFilterToken_TNG
{
    ApplicationArea = All;
    Caption = 'Test Filter Token';
    UsageCategory = Tasks;
    dataset
    {
        dataitem(Integer; "Integer")
        {
            DataItemTableView = sorting(Number);
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                field(MyDateFilterTextField; MyDateFilterText)
                {
                    ApplicationArea = All;
                    Caption = 'My Date Filter Text';

                    trigger OnValidate()
                    var
                        FilterTokens: Codeunit "Filter Tokens";
                    begin
                        FilterTokens.MakeDateFilter(MyDateFilterText);
                    end;
                }
            }
        }
    }

    var
        MyDateFilterText: Text;
}
