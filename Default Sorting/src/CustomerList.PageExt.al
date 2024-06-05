pageextension 60001 "Customer List_TNG" extends "Customer List"
{
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey(Name);
        Rec.Ascending(false);
    end;

}
