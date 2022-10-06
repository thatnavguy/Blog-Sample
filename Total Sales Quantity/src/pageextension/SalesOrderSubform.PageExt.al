pageextension 60001 "Sales Order Subform_TNG" extends "Sales Order Subform"
{
    layout
    {
        addbefore("Total Amount Excl. VAT")
        {
            field("Total Quantity_TNG"; TotalSalesLine.Quantity)
            {
                ApplicationArea = Basic, Suite;
                DecimalPlaces = 0 : 5;
                Caption = 'Total Quantity';
                Editable = false;
                ToolTip = 'Specifies the sum of the quantity on all lines in the document.';
            }
        }
    }
}
