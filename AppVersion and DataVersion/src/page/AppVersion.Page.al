page 60081 "App Version_TNG"
{
    ApplicationArea = All;
    Caption = 'App Version';
    PageType = List;
    SourceTable = "App Version_TNG";
    UsageCategory = History;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Entry No. field.';
                }
                field("Execution Content"; Rec."Execution Content")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Execution Content field.';
                }
                field("App Version"; Rec."App Version")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of App Version field.';
                }
                field("Data Version"; Rec."Data Version")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Data Version field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Comment field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(InsertVersion)
            {
                ApplicationArea = All;
                Caption = 'Insert Version';
                ToolTip = 'Insert Version.';
                Image = Versions;

                trigger OnAction()
                var
                    AppVersion: Record "App Version_TNG";
                begin
                    AppVersion.InsertVersion('Page Action');
                end;
            }
        }
    }
}
