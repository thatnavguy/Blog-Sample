table 60081 "App Version_TNG"
{
    Caption = 'App Version';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Execution Content"; Text[50])
        {
            Caption = 'Execution Content';
            DataClassification = CustomerContent;
        }
        field(3; "App Version"; Text[10])
        {
            Caption = 'App Version';
            DataClassification = CustomerContent;
        }
        field(4; "Data Version"; Text[10])
        {
            Caption = 'Data Version';
            DataClassification = CustomerContent;
        }
        field(5; "Comment"; Text[30])
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure InsertVersion(CommentText: Text[30])
    var
        CurrModuleInfo: ModuleInfo;
    begin
        NAVApp.GetCurrentModuleInfo(CurrModuleInfo);
        Rec.Init();
        Rec."Execution Content" := Format(GetExecutionContext());
        Rec."App Version" := Format(CurrModuleInfo.AppVersion);
        Rec."Data Version" := Format(CurrModuleInfo.DataVersion);
        Rec.Comment := CommentText;
        Rec.Insert();
    end;
}
