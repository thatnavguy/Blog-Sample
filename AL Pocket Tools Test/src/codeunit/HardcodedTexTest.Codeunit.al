codeunit 60067 HardcodedTexTest_TNG
{
    local procedure ValidateItemNo(ItemNo: Code[20])
    begin
        if ItemNo = '' then
            Error('Item No. %1 is not valid.', ItemNo);
    end;

    local procedure ShowWarehouseShipmentCreationSuccessMessage(WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        Message('%1 Warehouse Shipments were created.', WarehouseShipmentHeader.Count());
    end;
}
