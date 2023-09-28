codeunit 60081 "Subscriber DocMail_TNG"
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", 'OnBeforeSendEmail', '', false, false)]
    local procedure DocumentMailing_OnBeforeSendEmail(var ReportUsage: Integer; var TempEmailItem: Record "Email Item"; var IsFromPostedDoc: Boolean; var PostedDocNo: Code[20])
    begin
        If IsFromPostedDoc And (ReportUsage = Enum::"Report Selection Usage"::"S.Invoice".AsInteger()) then
            SendInvoiceAttachments(PostedDocNo, TempEmailItem);
    end;

    local procedure SendInvoiceAttachments(PostedSalesInvoiceNo: Code[20]; var TempEmailItem: Record "Email Item")
    var
        DocumentAttachment: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
    begin
        if PostedSalesInvoiceNo = '' then
            exit;

        DocumentAttachment.Reset();
        DocumentAttachment.SetRange("Table ID", Database::"Sales Invoice Header");
        DocumentAttachment.SetRange("No.", PostedSalesInvoiceNo);
        If DocumentAttachment.FindSet() then
            repeat
                If DocumentAttachment."Document Reference ID".HasValue then begin
                    Clear(TempBlob);
                    TempBlob.CreateOutStream(FileOutStream);
                    TempBlob.CreateInStream(FileInStream);
                    DocumentAttachment."Document Reference ID".ExportStream(FileOutStream);
                    TempEmailItem.AddAttachment(FileInStream, DocumentAttachment."File Name" + '.' + DocumentAttachment."File Extension");
                end;
            until DocumentAttachment.Next() = 0;
    end;
}
