page 60501 "Regex Test_TNG"
{
    ApplicationArea = All;
    Caption = 'Regex Test';
    PageType = List;
    SourceTable = "Regex Test_TNG";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Phone Number"; Rec."Phone Number")
                {
                }
            }
        }
    }
}
