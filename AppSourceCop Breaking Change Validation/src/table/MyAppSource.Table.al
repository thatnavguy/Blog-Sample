table 50000001 "My App Source_TNG"
{
    Caption = 'My App Source';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
