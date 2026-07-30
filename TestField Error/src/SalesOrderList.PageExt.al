pageextension 60201 "Sales Order List_TNG" extends "Sales Order List"
{
    actions
    {
        addlast(Processing)
        {
            action(TestCustomerFieldError_TNG)
            {
                ApplicationArea = All;
                Caption = 'Test Customer Field Error';
                ToolTip = 'Test Customer Field Error';
                Image = Warning;
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.FindFirst();
                    Customer.TestField("Name 2");
                end;
            }
            action(TestValueCustomerFieldError_TNG)
            {
                ApplicationArea = All;
                Caption = 'Test Value Customer Field Error';
                ToolTip = 'Test Value Customer Field Error';
                Image = Warning;
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.FindFirst();
                    Customer.TestField("Name 2", 'ABC');
                end;
            }
            action(TestSalesHeaderFieldError_TNG)
            {
                ApplicationArea = All;
                Caption = 'Test SalesHeader Field Error';
                ToolTip = 'Test SalesHeader Field Error';
                Image = Warning;
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.FindFirst();
                    SalesHeader.TestField("Sell-to Customer Name 2");
                end;
            }
        }
    }

}
