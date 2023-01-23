page 60061 "Test Persistent Blob_TNG"
{
    Caption = 'Test Persistent Blob';
    PageType = List;
    UsageCategory = Tasks;
    ApplicationArea = All;
    SourceTable = "Test Persistent Blob_TNG";
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Key"; Rec."Blob Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Key field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of File Name field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActImportPersistentBlob)
            {
                ApplicationArea = All;
                Caption = 'Import Persistent Blob';
                ToolTip = 'Import Persistent Blob.';
                Image = Import;

                trigger OnAction()
                var
                    FileName: Text;
                begin
                    Rec.Init();
                    if ImportPersistentBlob(Rec."Blob Key", FileName) then begin
                        Rec."File Name" := CopyStr(FileName, 1, 250);
                        Rec.Insert();
                    end;
                end;
            }
            action(ActExportPersistentBlob)
            {
                ApplicationArea = All;
                Caption = 'Export Persistent Blob';
                ToolTip = 'Export Persistent Blob.';
                Image = Export;

                trigger OnAction()
                begin
                    ExportPersistentBlob(Rec."Blob Key", Rec."File Name");
                end;
            }
            action(ActCheckPersistentBlobExists)
            {
                ApplicationArea = All;
                Caption = 'Check if Persistent Blob exists';
                ToolTip = 'Check if Persistent Blob exists.';
                Image = Export;

                trigger OnAction()
                begin
                    CheckPersistentBlobExists(Rec."Blob Key");
                end;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
        PersistentBlob: Codeunit "Persistent Blob";
    begin
        if PersistentBlob.Exists(Rec."Blob Key") then
            PersistentBlob.Delete(Rec."Blob Key");
    end;

    local procedure ExportPersistentBlob(BlobKey: BigInteger; FileName: Text)
    var
        PersistentBlob: Codeunit "Persistent Blob";
        TempBlob: Codeunit "Temp Blob";
        FileOutstream: OutStream;
        FileInstream: InStream;
    begin
        if PersistentBlob.Exists(BlobKey) then begin
            TempBlob.CreateOutStream(FileOutstream);
            PersistentBlob.CopyToOutStream(BlobKey, FileOutstream);
            TempBlob.CreateInStream(FileInstream);

            DownloadFromStream(FileInstream, '', '', '', FileName);
        end else
            Error('Persistent Blob does not exist');
    end;

    local procedure ImportPersistentBlob(var BlobKey: BigInteger; var FileName: Text): Boolean
    var
        PersistentBlob: Codeunit "Persistent Blob";
        FileInstream: InStream;
    begin
        if UploadIntoStream('Upload File', '', '', FileName, FileInstream) then begin //import file into InStream
            BlobKey := PersistentBlob.Create(); //get new primary key
            PersistentBlob.CopyFromInStream(BlobKey, FileInstream); //copy blob from InStream into Persistent Blob
            exit(true);
        end;
        exit(false);
    end;

    local procedure CheckPersistentBlobExists(BlobKey: BigInteger)
    var
        PersistentBlob: Codeunit "Persistent Blob";
    begin
        Message('Persistent Blob exists: ' + Format(PersistentBlob.Exists(BlobKey)));
    end;
}
