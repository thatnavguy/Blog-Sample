pageextension 60211 CustomerList_TNG extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(TestIsModified)
            {
                ApplicationArea = All;
                Caption = 'Test Is Modified';
                Image = Process;
                ToolTip = 'Test Is Modified.';
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.FindFirst();
                    UpdateCustomerUsingIsModified(Customer, 'New Name', 10000);
                end;

            }
            action(TestIsDirty)
            {
                ApplicationArea = All;
                Caption = 'Test Is Dirty';
                Image = Process;
                ToolTip = 'Test Is Dirty.';
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.FindFirst();
                    UpdateCustomerUsingIsDirty(Customer, 'New Name 2', 10000);
                end;

            }

            action(TestIsDirtyRecordRef)
            {
                ApplicationArea = All;
                Caption = 'Test Is Dirty RecordRef';
                Image = Process;
                ToolTip = 'Test Is Dirty RecordRef.';
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.FindFirst();
                    UpdateCustomerUsingIsDirtyRecordRef(Customer, 'New Name 3', 10000);
                end;

            }
        }
    }

    local procedure UpdateCustomerUsingIsModified(var Customer: Record Customer; NewName: Text[100]; CreditLimit: Decimal)
    var
        IsModified: Boolean;
    begin
        if Customer.Name <> NewName then begin
            Customer.Validate(Name, NewName);
            IsModified := true;
        end;
        if Customer."Credit Limit (LCY)" <> CreditLimit then begin
            Customer.Validate("Credit Limit (LCY)", CreditLimit);
            IsModified := true;
        end;

        if IsModified then begin
            Customer.Modify(true);
            Message('Customer record has been modified.');
        end;
    end;

    local procedure UpdateCustomerUsingIsDirty(var Customer: Record Customer; NewName: Text[100]; CreditLimit: Decimal)
    begin
        if Customer.Name <> NewName then
            Customer.Validate(Name, NewName);

        if Customer."Credit Limit (LCY)" <> CreditLimit then
            Customer.Validate("Credit Limit (LCY)", CreditLimit);

        if Customer.IsDirty() then begin
            Customer.Modify(true);
            Message('Customer record has been modified.');
        end;
    end;



    local procedure UpdateCustomerUsingIsDirtyRecordRef(var Customer: Record Customer; NewName: Text[100]; CreditLimit: Decimal)
    var
        CustomerRef: RecordRef;
    begin
        if Customer.Name <> NewName then
            Customer.Validate(Name, NewName);

        if Customer."Credit Limit (LCY)" <> CreditLimit then
            Customer.Validate("Credit Limit (LCY)", CreditLimit);

        CustomerRef := Customer;

        if CustomerRef.IsDirty() then begin
            Customer.Modify(true);
            Message('Customer record has been modified.');
        end;
    end;
}
