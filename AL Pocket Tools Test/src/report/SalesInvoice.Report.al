report 60061 "SalesInvoice_TNG"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Sales Invoice';
    DefaultRenderingLayout = SalesInvoiceLayout;
    PDFFontEmbedding = Yes;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            CalcFields = "Amount Including VAT";

            column(CompPicture; CompanyInformation.Picture) { }
            column(CompanyName; CompanyInformation.Name) { }
            column(CompAddress; CompanyInformation.Address) { }
            column(CompAddress2; CompanyInformation."Address 2") { }
            column(CompCity; CompanyInformation.City + ' ' + CompanyInformation."Post Code") { }
            column(CompCountry; CompanyInformation."Country/Region Code") { }
            column(CompEmail; 'Email : ' + CompanyInformation."E-Mail") { }
            column(CompPostCode; CompanyInformation."Post Code") { }
            column(PaymentTermsDesc; PaymentTerms.Description) { }
            column(ShipMethodDesc; ShipmentMethod.Description) { }
            column(ShipAgentName; ShippingAgent.Name) { }
            column(ShipAgentCode; ShippingAgent.Code) { }
            column(TransportDesc; TransportMethodDescription) { }

            column(InvoiceNo; "No.") { }
            column(YourRef; "Your Reference") { }
            column(PostingDate; "Posting Date") { }
            column(OrderDate; "Order Date") { }
            column(BilltoName; "Bill-to Name") { }
            column(BilltoAddress; "Bill-to Address") { }
            column(BilltoAddress2; "Bill-to Address 2") { }
            column(BilltoCity; "Bill-to City" + ' ' + "Bill-to Post Code") { }
            column(BilltoCountry; "Bill-to Country/Region Code") { }
            column(ShiptoName; "Ship-to Name") { }
            column(ShiptoAddress; "Ship-to Address") { }
            column(ShiptoAddress2; "Ship-to Address 2") { }
            column(ShiptoCity; "Ship-to City" + ' ' + "Ship-to Post Code") { }
            column(ShiptoCountry; '') { }
            column(PortofDischarge; "Ship-to Country/Region Code") { }
            column(PortofLoading; Location.City) { }
            column(CountryofOrigin; Location."Country/Region Code") { }
            column(CustBankName; CustomerBankName) { }
            column(CustSwiftCode; CustomerSwiftCode) { }
            column(CustBankAddr; CustomerBankAddress) { }
            column(blnPrintComputergen; PrintComputerGenerated) { }
            column(GSTRegNo; CompanyInformation."VAT Registration No.") { }
            column(AmountinWords; NumberText[1] + ' ' + NumberText[2]) { }
            column(Currencyfactor; "Currency Factor") { }
            column(FreightCharges; FreightCharges) { }
            column(Insurance; Insurance) { }
            column(TradeDiscount; TradeDiscount) { }
            column(AmtIncVAT; "Amount Including VAT") { }
            column(AddCurrCode; GeneralLedgerSetup."Additional Reporting Currency") { }
            column(AddCurrFactor; AdditionalCurrencyFactor) { }
            column(AddCurrExchRate; AdditionalCurrencyExchangeRate) { }
            column(TotalExclVATText; TotalExcludingVATText) { }
            column(TotalInclVATText; TotalIncludingVATText) { }
            column(TotalExclVATTextLCY; TotalExcludingVATTextLCY) { }
            column(TotalInclVATTextLCY; TotalIncludingVATTextLCY) { }
            column(TotVATAmt; TotalVATAmount) { }
            column(TotalGSTBaseAmount; TotalGSTBaseAmount) { }

            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                DataItemLink = "Document No." = field("No.");

                column(ItemNo; "No.") { }
                column(SILQtys; Quantity) { }
                column(SILUnitPrice; "Unit Price") { }
                column(SILLineDisPer; "Line Discount %") { }
                column(SILLineDisAmt; "Line Discount Amount") { }
                column(LineAmt; "Line Amount") { }
                column(ItemDesc; ItemDescription) { }
                column(ItemCoo; ItemCountryOfOrigin) { }
                column(InvDisc; "Inv. Discount Amount") { }
                column(Sno; SerialNumber) { }
                column(UOM; "Unit of Measure Code") { }
                column(TotQty; TotalQuantity) { }
                column(TotAmt; TotalAmount) { }
                column(TotInvDisc; TotalInvoiceDiscount) { }
                column(VATPer; "VAT %") { }
                column(VATAmount; "Amount Including VAT" - Amount) { }
                column(ItemGTIN; ItemGTIN) { }

                trigger OnPreDataItem()
                begin
                    // PreDataItem trigger
                end;

                trigger OnAfterGetRecord()
                begin
                end;
            }

            trigger OnPreDataItem()
            begin
                CompanyInformation.SetLoadFields(Name, Address, "Address 2", City, "Post Code", "Country/Region Code", "E-Mail", "VAT Registration No.", Picture);
                CompanyInformation.ReadIsolation := IsolationLevel::ReadUncommitted;
                CompanyInformation.SetAutoCalcFields(Picture);
                CompanyInformation.Get();
            end;

            trigger OnAfterGetRecord()
            var
            begin
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                }
            }
        }

        trigger OnOpenPage()
        begin
        end;
    }

    rendering
    {
        layout(SalesInvoiceLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Report/Layout/SalesInvoice.rdl';
        }
    }

    trigger OnPreReport()
    begin
    end;

    var
        CompanyInformation: Record "Company Information";
        GeneralLedgerSetup: Record "General Ledger Setup";
        PaymentTerms: Record "Payment Terms";
        ShipmentMethod: Record "Shipment Method";
        ShippingAgent: Record "Shipping Agent";
        Location: Record Location;
        CustomerBankName: Text;
        CustomerSwiftCode: Code[20];
        CustomerBankAddress: Text;
        ItemDescription: Text;
        ItemCountryOfOrigin: Code[10];
        TransportMethodDescription: Text[100];
        FreightCharges: Decimal;
        Insurance: Decimal;
        TradeDiscount: Decimal;
        ItemGTIN: Code[14];
        SerialNumber: Integer;
        TotalQuantity: Decimal;
        TotalAmount: Decimal;
        TotalInvoiceDiscount: Decimal;
        TotalVATAmount: Decimal;
        TotalGSTBaseAmount: Decimal;
        AdditionalCurrencyFactor: Decimal;
        AdditionalCurrencyExchangeRate: Decimal;
        TotalExcludingVATText: Text[50];
        TotalIncludingVATText: Text[50];
        TotalExcludingVATTextLCY: Text[50];
        TotalIncludingVATTextLCY: Text[50];
        NumberText: array[2] of Text[80];
        PrintComputerGenerated: Boolean;





}
