table 60521 Fruit
{
    Caption = 'Fruit';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; Fruit; Enum "Test Enum_TNG")
        {
            Caption = 'Fruit';
        }
    }
    keys
    {
        key(PK; Fruit)
        {
            Clustered = true;
        }
    }
}
