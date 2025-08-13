table 60501 "Regex Test_TNG"
{
    Caption = 'Regex Test';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Phone Number"; Text[30])
        {
            Caption = 'Phone Number';
            trigger OnValidate()
            var
                Regex: Codeunit Regex;
            begin
                if not Regex.IsMatch("Phone Number", '^\+?[0-9]\d{1,14}$') then
                    Error('Invalid phone number format: %1', "Phone Number");
            end;
        }
    }
    keys
    {
        key(PK; "Phone Number")
        {
            Clustered = true;
        }
    }
}
