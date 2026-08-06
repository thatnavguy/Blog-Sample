codeunit 60063 ALSetLoadFields_TNG
{
    procedure FindSalesOrders()
    var
        SalesHeader: Record "Sales Header";
        OrderDate: Date;
        OrderNo: Code[20];
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetLoadFields("No.", "Order Date", "Sell-to Customer Name", "Sell-to Customer No.");
        SalesHeader.ReadIsolation := IsolationLevel::ReadUncommitted;
        SalesHeader.FindSet();

        repeat
            OrderDate := SalesHeader."Order Date";
            OrderNo := SalesHeader."No.";
            ProcessSalesOrders(OrderDate, OrderNo, SalesHeader."Sell-to Customer No.", SalesHeader."Sell-to Customer Name");
        until SalesHeader.Next() = 0;
    end;




    procedure ProcessSalesOrders(OrderDate: Date; OrderNo: Code[20]; CustomerNo: Code[20]; CustomerName: Text): Boolean
    begin

    end;
}
