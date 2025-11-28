report 60061 "Report With SaveValues_TNG"
{
    ApplicationArea = All;
    Caption = 'Report With SaveValues';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = MyLayout;

    dataset
    {
        dataitem(Integer; "Integer")
        {
            DataItemTableView = sorting(Number);
            MaxIteration = 1;
            column(Number_Integer; Number)
            {
            }
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }

    rendering
    {
        layout(MyLayout)
        {
            LayoutFile = 'Layouts\MySaveValuesLayout.rdlc';
            Type = RDLC;
        }
    }
}
