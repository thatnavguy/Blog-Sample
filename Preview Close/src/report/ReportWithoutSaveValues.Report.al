report 60062 "Report Without SaveValues_TNG"
{
    ApplicationArea = All;
    Caption = 'Report Without SaveValues';
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
            LayoutFile = 'Layouts\MyNonSaveValuesLayout.rdlc';
            Type = RDLC;
        }
    }
}
