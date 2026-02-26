page 60081 "My Sales Line_TNG"
{
    ApplicationArea = All;
    Caption = 'My Sales Line';
    PageType = List;
    SourceTable = "Sales Line";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                FreezeColumn = "Line No.";
                field("Document No."; Rec."Document No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Type"; Rec."Type")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Unit Volume"; Rec."Unit Volume")
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Units per Parcel"; Rec."Units per Parcel")
                {
                }
                field("Use Duplication List"; Rec."Use Duplication List")
                {
                }
                field("ATO Whse. Outstanding Qty."; Rec."ATO Whse. Outstanding Qty.")
                {
                }
                field("ATO Whse. Outstd. Qty. (Base)"; Rec."ATO Whse. Outstd. Qty. (Base)")
                {
                }
                field("Alloc. Acc. Modified by User"; Rec."Alloc. Acc. Modified by User")
                {
                }
                field("Alloc. Sales Line SystemId"; Rec."Alloc. Sales Line SystemId")
                {
                }
                field("Allocation Account No."; Rec."Allocation Account No.")
                {
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                }
                field("Allow Item Charge Assignment"; Rec."Allow Item Charge Assignment")
                {
                }
                field("Allow Line Disc."; Rec."Allow Line Disc.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount (ACY)"; Rec."Amount (ACY)")
                {
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                }
                field("Amount Including VAT (ACY)"; Rec."Amount Including VAT (ACY)")
                {
                }
                field("Appl.-from Item Entry"; Rec."Appl.-from Item Entry")
                {
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                }
                field("Area"; Rec."Area")
                {
                }
                field("Attached Doc Count"; Rec."Attached Doc Count")
                {
                }
                field("Attached Lines Count"; Rec."Attached Lines Count")
                {
                }
                field("Attached to Line No."; Rec."Attached to Line No.")
                {
                }
                field("BOM Item No."; Rec."BOM Item No.")
                {
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                }
                field("Bin Code"; Rec."Bin Code")
                {
                }
                field("Blanket Order Line No."; Rec."Blanket Order Line No.")
                {
                }
                field("Blanket Order No."; Rec."Blanket Order No.")
                {
                }
                field("Completely Shipped"; Rec."Completely Shipped")
                {
                }
                field("Copied From Posted Doc."; Rec."Copied From Posted Doc.")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Customer Disc. Group"; Rec."Customer Disc. Group")
                {
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                }
                field("Deferral Code"; Rec."Deferral Code")
                {
                }
                field("Depr. until FA Posting Date"; Rec."Depr. until FA Posting Date")
                {
                }
                field("Depreciation Book Code"; Rec."Depreciation Book Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Drop Shipment"; Rec."Drop Shipment")
                {
                }
                field("Duplicate in Depreciation Book"; Rec."Duplicate in Depreciation Book")
                {
                }
                field("Exit Point"; Rec."Exit Point")
                {
                }
                field("FA Posting Date"; Rec."FA Posting Date")
                {
                }
                field("Full GST"; Rec."Full GST")
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                }
                field("IC Item Reference No."; Rec."IC Item Reference No.")
                {
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                }
                field("IC Partner Ref. Type"; Rec."IC Partner Ref. Type")
                {
                }
                field("IC Partner Reference"; Rec."IC Partner Reference")
                {
                }
                field("Inv. Disc. Amount to Invoice"; Rec."Inv. Disc. Amount to Invoice")
                {
                }
                field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
                {
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                }
                field("Item Charge Qty. to Handle"; Rec."Item Charge Qty. to Handle")
                {
                }
                field("Item Reference No."; Rec."Item Reference No.")
                {
                }
                field("Item Reference Type"; Rec."Item Reference Type")
                {
                }
                field("Item Reference Type No."; Rec."Item Reference Type No.")
                {
                }
                field("Item Reference Unit of Measure"; Rec."Item Reference Unit of Measure")
                {
                }
                field("Job Contract Entry No."; Rec."Job Contract Entry No.")
                {
                }
                field("Job No."; Rec."Job No.")
                {
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                }
                field("Line Discount Calculation"; Rec."Line Discount Calculation")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Net Weight"; Rec."Net Weight")
                {
                }
                field(Nonstock; Rec.Nonstock)
                {
                }
                field("Originally Ordered No."; Rec."Originally Ordered No.")
                {
                }
                field("Originally Ordered Var. Code"; Rec."Originally Ordered Var. Code")
                {
                }
                field("Out-of-Stock Substitution"; Rec."Out-of-Stock Substitution")
                {
                }
                field("Outbound Whse. Handling Time"; Rec."Outbound Whse. Handling Time")
                {
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                }
                field("Outstanding Amount (LCY)"; Rec."Outstanding Amount (LCY)")
                {
                }
                field("Outstanding Qty. (Base)"; Rec."Outstanding Qty. (Base)")
                {
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                }
                field(Planned; Rec.Planned)
                {
                }
                field("Planned Delivery Date"; Rec."Planned Delivery Date")
                {
                }
                field("Planned Shipment Date"; Rec."Planned Shipment Date")
                {
                }
                field("Pmt. Discount Amount"; Rec."Pmt. Discount Amount")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                field("Prepayment %"; Rec."Prepayment %")
                {
                }
                field("Prepayment Amount"; Rec."Prepayment Amount")
                {
                }
                field("Prepayment Line"; Rec."Prepayment Line")
                {
                }
                field("Prepayment Tax Area Code"; Rec."Prepayment Tax Area Code")
                {
                }
                field("Prepayment Tax Group Code"; Rec."Prepayment Tax Group Code")
                {
                }
                field("Prepayment Tax Liable"; Rec."Prepayment Tax Liable")
                {
                }
                field("Prepayment VAT %"; Rec."Prepayment VAT %")
                {
                }
                field("Prepayment VAT Difference"; Rec."Prepayment VAT Difference")
                {
                }
                field("Prepayment VAT Identifier"; Rec."Prepayment VAT Identifier")
                {
                }
                field("Prepmt Amt Deducted"; Rec."Prepmt Amt Deducted")
                {
                }
                field("Prepmt Amt to Deduct"; Rec."Prepmt Amt to Deduct")
                {
                }
                field("Prepmt VAT Diff. Deducted"; Rec."Prepmt VAT Diff. Deducted")
                {
                }
                field("Prepmt VAT Diff. to Deduct"; Rec."Prepmt VAT Diff. to Deduct")
                {
                }
                field("Prepmt. Amount Inv. (LCY)"; Rec."Prepmt. Amount Inv. (LCY)")
                {
                }
                field("Prepmt. Amount Inv. Incl. VAT"; Rec."Prepmt. Amount Inv. Incl. VAT")
                {
                }
                field("Prepmt. Amt. Incl. VAT"; Rec."Prepmt. Amt. Incl. VAT")
                {
                }
                field("Prepmt. Amt. Inv."; Rec."Prepmt. Amt. Inv.")
                {
                }
                field("Prepmt. Line Amount"; Rec."Prepmt. Line Amount")
                {
                }
                field("Prepmt. Pmt. Discount Amount"; Rec."Prepmt. Pmt. Discount Amount")
                {
                }
                field("Prepmt. VAT Amount Deducted"; Rec."Prepmt. VAT Amount Deducted")
                {
                }
                field("Prepmt. VAT Amount Inv. (LCY)"; Rec."Prepmt. VAT Amount Inv. (LCY)")
                {
                }
                field("Prepmt. VAT Base Amt."; Rec."Prepmt. VAT Base Amt.")
                {
                }
                field("Prepmt. VAT Base Deducted"; Rec."Prepmt. VAT Base Deducted")
                {
                }
                field("Prepmt. VAT Calc. Type"; Rec."Prepmt. VAT Calc. Type")
                {
                }
                field("Price Calculation Method"; Rec."Price Calculation Method")
                {
                }
                field("Price description"; Rec."Price description")
                {
                }
                field("Profit %"; Rec."Profit %")
                {
                }
                field("Promised Delivery Date"; Rec."Promised Delivery Date")
                {
                }
                field("Purch. Order Line No."; Rec."Purch. Order Line No.")
                {
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                }
                field("Purchasing Code"; Rec."Purchasing Code")
                {
                }
                field("Qty. Assigned"; Rec."Qty. Assigned")
                {
                }
                field("Qty. Invoiced (Base)"; Rec."Qty. Invoiced (Base)")
                {
                }
                field("Qty. Rounding Precision"; Rec."Qty. Rounding Precision")
                {
                }
                field("Qty. Rounding Precision (Base)"; Rec."Qty. Rounding Precision (Base)")
                {
                }
                field("Qty. Shipped (Base)"; Rec."Qty. Shipped (Base)")
                {
                }
                field("Qty. Shipped Not Invd. (Base)"; Rec."Qty. Shipped Not Invd. (Base)")
                {
                }
                field("Qty. Shipped Not Invoiced"; Rec."Qty. Shipped Not Invoiced")
                {
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                }
                field("Qty. to Asm. to Order (Base)"; Rec."Qty. to Asm. to Order (Base)")
                {
                }
                field("Qty. to Assemble to Order"; Rec."Qty. to Assemble to Order")
                {
                }
                field("Qty. to Assign"; Rec."Qty. to Assign")
                {
                }
                field("Qty. to Invoice"; Rec."Qty. to Invoice")
                {
                }
                field("Qty. to Invoice (Base)"; Rec."Qty. to Invoice (Base)")
                {
                }
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                }
                field("Qty. to Ship (Base)"; Rec."Qty. to Ship (Base)")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                }
                field("Quantity Shipped"; Rec."Quantity Shipped")
                {
                }
                field("Recalculate Invoice Disc."; Rec."Recalculate Invoice Disc.")
                {
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                }
                field(Reserve; Rec.Reserve)
                {
                }
                field("Reserved Qty. (Base)"; Rec."Reserved Qty. (Base)")
                {
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Ret. Qty. Rcd. Not Invd.(Base)"; Rec."Ret. Qty. Rcd. Not Invd.(Base)")
                {
                }
                field("Return Qty. Rcd. Not Invd."; Rec."Return Qty. Rcd. Not Invd.")
                {
                }
                field("Return Qty. Received"; Rec."Return Qty. Received")
                {
                }
                field("Return Qty. Received (Base)"; Rec."Return Qty. Received (Base)")
                {
                }
                field("Return Qty. to Receive"; Rec."Return Qty. to Receive")
                {
                }
                field("Return Qty. to Receive (Base)"; Rec."Return Qty. to Receive (Base)")
                {
                }
                field("Return Rcd. Not Invd."; Rec."Return Rcd. Not Invd.")
                {
                }
                field("Return Rcd. Not Invd. (LCY)"; Rec."Return Rcd. Not Invd. (LCY)")
                {
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                }
                field("Return Receipt Line No."; Rec."Return Receipt Line No.")
                {
                }
                field("Return Receipt No."; Rec."Return Receipt No.")
                {
                }
                field("Returns Deferral Start Date"; Rec."Returns Deferral Start Date")
                {
                }
                field("Selected Alloc. Account No."; Rec."Selected Alloc. Account No.")
                {
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                }
                field("Shipment Line No."; Rec."Shipment Line No.")
                {
                }
                field("Shipment No."; Rec."Shipment No.")
                {
                }
                field("Shipped Not Inv. (LCY) No VAT"; Rec."Shipped Not Inv. (LCY) No VAT")
                {
                }
                field("Shipped Not Invoiced"; Rec."Shipped Not Invoiced")
                {
                }
                field("Shipped Not Invoiced (LCY)"; Rec."Shipped Not Invoiced (LCY)")
                {
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                }
                field("Shipping Time"; Rec."Shipping Time")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                }
            }
        }
    }
}
