page 60231 "My Item Ledger Entries_TNG"
{
    ApplicationArea = All;
    Caption = 'My Item Ledger Entries';
    PageType = List;
    SourceTable = "Item Ledger Entry";
    UsageCategory = History;
    AnalysisModeEnabled = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the entry''s posting date.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item in the entry.';
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ToolTip = 'Specifies the quantity in the Quantity field that remains to be processed.';
                }
            }
        }
    }
}
