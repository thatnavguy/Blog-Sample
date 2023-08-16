pageextension 60111 "Item List_TNG" extends "Item List"
{
    layout
    {
        addafter(InventoryField)
        {
            field(InventoryIndicator_TNG; InventoryIndicator)
            {
                ApplicationArea = All;
                Caption = 'Inventory Indicator';
                ToolTip = 'Red = Out of Stock, Yellow = Low Stock, Green = In Stock';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec.Inventory >= 10 then
            InventoryIndicator := '✅'
        else
            if Rec.Inventory > 0 then
                InventoryIndicator := '⚠️'
            else
                InventoryIndicator := '❌';
    end;


    var
        InventoryIndicator: Text;
}
