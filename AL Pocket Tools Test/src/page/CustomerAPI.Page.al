page 60062 "CustomerAPI_TNG"
{
    APIGroup = 'thatnavguy';
    APIPublisher = 'teddy';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Customer Data';
    DataAccessIntent = ReadOnly;
    Editable = false;
    EntityName = 'customer';
    EntitySetName = 'customers';
    ODataKeyFields = "No.";
    PageType = API;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(no; Rec."No.") { }
                field(name; Rec.Name) { }
                field(customerPostingGroup; Rec."Customer Posting Group") { }
                field(blocked; Rec.Blocked) { }
            }
        }
    }
}