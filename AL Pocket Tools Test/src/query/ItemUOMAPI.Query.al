query 60061 "ItemUOMAPI_TNG"
{
    APIGroup = 'thatnavguy';
    APIPublisher = 'teddy';
    APIVersion = 'v1.0';
    EntityName = 'itemUOM';
    EntitySetName = 'itemUOMs';
    QueryType = API;

    elements
    {
        dataitem(itemUnitOfMeasure; "Item Unit of Measure")
        {
            column("code"; "Code")
            {
            }
            column(qtyPerUnitOfMeasure; "Qty. per Unit of Measure")
            {
            }
            dataitem(Item; "Item")
            {
                DataItemLink = "No." = itemUnitOfMeasure."Item No.";
                SqlJoinType = InnerJoin;

                column(itemNo; "No.")
                {
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
