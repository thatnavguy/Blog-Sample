pageextension 60211 CustomerList_TNG extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(TestExcelBuffer)
            {
                ApplicationArea = All;
                Caption = 'Test Excel Buffer';
                Image = Process;
                ToolTip = 'Test adding text to the Excel Buffer.';
                trigger OnAction()
                var
                    TempExcelBuffer: Record "Excel Buffer" temporary;
                    ValueText: Text;
                    Counter: Integer;
                begin
                    for Counter := 1 to 500 do
                        ValueText += 'a';
                    TempExcelBuffer.AddColumn(ValueText, false, '', false, false, false, '', 0);
                end;

            }
        }
    }
}
