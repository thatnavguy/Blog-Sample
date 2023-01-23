table 60061 "Test Persistent Blob_TNG"
{
    Caption = 'Test Persistent Blob';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Blob Key"; BigInteger)
        {
            Caption = 'Blob Key';
            DataClassification = CustomerContent;
        }
        field(2; "File Name"; Text[250])
        {
            Caption = 'File Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Blob Key")
        {
            Clustered = true;
        }
    }
}
