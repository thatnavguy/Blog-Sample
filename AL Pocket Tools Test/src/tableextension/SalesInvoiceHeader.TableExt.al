tableextension 60062 "Sales Invoice Header_TNG" extends "Sales Invoice Header"
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
