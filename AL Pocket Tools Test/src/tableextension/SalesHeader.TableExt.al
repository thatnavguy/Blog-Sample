tableextension 60061 SalesHeader_TNG extends "Sales Header"
{
    fields
    {
        field(60061; "Truck No."; Code[20])
        {
            Caption = 'Truck No.';
            DataClassification = CustomerContent;
        }
    }
}
