codeunit 60066 CopyDocument_TNG
{



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", OnAfterCopyFieldsFromOldSalesHeader, '', false, false)]
    local procedure OnAfterCopyFieldsFromOldSalesHeader(OldSalesHeader: Record "Sales Header"; var ToSalesHeader: Record "Sales Header")
    begin
        ToSalesHeader."Truck No." := '';
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", OnCopySalesDocOnAfterTransferPostedInvoiceFields, '', false, false)]
    local procedure OnCopySalesDocOnAfterTransferPostedInvoiceFields(var ToSalesHeader: Record "Sales Header"; SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        ToSalesHeader."Truck No." := '';
    end;




}
