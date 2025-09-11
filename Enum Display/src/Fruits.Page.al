namespace EnumDisplay.EnumDisplay;

page 60521 Fruits
{
    ApplicationArea = All;
    Caption = 'Fruits';
    PageType = List;
    SourceTable = Fruit;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Fruit; Rec.Fruit)
                {
                }
            }
        }
    }
}
