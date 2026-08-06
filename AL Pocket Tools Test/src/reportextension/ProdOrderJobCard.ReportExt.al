reportextension 60061 "ProdOrderJobCard_TNG" extends "Prod. Order - Job Card"
{
    dataset
    {
        add("Production Order")
        {
            column(ProdOrderNoQRCode_TNG; ProdOrderNoQRCode)
            {
            }
        }
        modify("Production Order")
        {
            trigger OnAfterAfterGetRecord()
            begin
                GenerateQRCode();
            end;
        }

        modify("Prod. Order Routing Line")
        {
            trigger OnBeforePreDataItem()
            begin
                if WorkCenterFilter <> '' then
                    SetRange("Work Center No.", WorkCenterFilter);
            end;

            trigger OnAfterAfterGetRecord()
            begin
            end;
        }
    }

    requestpage
    {
        layout
        {
            addlast(Content)
            {
                field(FieldWorkCenterFilter; WorkCenterFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Work Center Filter';
                    TableRelation = "Work Center"."No.";
                    ToolTip = 'Specifies a filter for the work center field on the job card.';

                }
            }
        }
    }

    rendering
    {
        layout(HellersProdOrderJobCard)
        {
            Caption = 'Hellers Production Order Job Card';
            LayoutFile = 'src/Common/layout/HellersProdOrderJobCard.rdl';
            Type = RDLC;
        }
    }

    local procedure GenerateQRCode()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
    begin
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";
        ProdOrderNoQRCode := BarcodeFontProvider2D.EncodeFont("Production Order"."No.", BarcodeSymbology2D);
    end;

    var
        WorkCenterFilter: Code[20];
        ProdOrderNoQRCode: Text;
}
