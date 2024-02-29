pageextension 60271 "General Journal KeepDesc_TNG" extends "General Journal"
{
    layout
    {
        addafter(Description)
        {
            field("Keep Description_TNG"; Rec."Keep Description")
            {
                ApplicationArea = All;
                Caption = 'Keep Description';
                ToolTip = 'Prevent Description from being modified when updating the Account Type';
                Editable = true;
            }
        }
    }
}
