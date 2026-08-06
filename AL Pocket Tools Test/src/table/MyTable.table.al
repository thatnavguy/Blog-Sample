table 60061 MyTableTNG
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "PK"; Code[20])
        {
            Caption = 'PK';
        }
        field(2; "Item No.TNG"; Code[20])
        {
            Caption = 'Item No.TNG';
        }
        field(3; "Item DescriptionTNG"; Code[20])
        {
            Caption = 'Item DescriptionTNG';
        }
        field(4; "Item UnitTNG"; Text[20])
        {
            Caption = 'Item UnitTNG';
        }

    }

    keys
    {
        key(PK; "PK")
        {
            Clustered = true;
        }
    }

}