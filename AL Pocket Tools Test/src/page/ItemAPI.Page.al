page 60061 "ItemAPI_TNG"
{
    APIGroup = 'thatnavguy';
    APIPublisher = 'teddy';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Item Data';
    DataAccessIntent = ReadOnly;
    Editable = false;
    EntityName = 'item';
    EntitySetName = 'items';
    ODataKeyFields = "No.";
    PageType = API;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(no; Rec."No.") { }
                field(description; Rec.Description) { }
                field(searchDescription; Rec."Search Description") { }
                field(itemCategoryCode; Rec."Item Category Code") { }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure") { }
                field(blocked; Rec.Blocked) { }
            }
        }
    }
}