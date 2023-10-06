pageextension 60120 "Customer List_TNG" extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(LoopAction)
            {
                Caption = 'Loop Action';
                ToolTip = 'Loop Action';
                Image = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    i: Integer;
                    MyAmount: Decimal;
                begin
                    MyAmount := 100;
                    for i := 1 to 50 do
                        MyAmount := MyAmount + (MyAmount * i);
                end;
            }
        }
    }
}
