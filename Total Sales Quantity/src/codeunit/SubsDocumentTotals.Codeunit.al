codeunit 60001 "Subs Document Totals_TNG"
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnAfterSalesDeltaUpdateTotals', '', false, false)]
    local procedure DocumentTotals_OnAfterSalesDeltaUpdateTotals(var TotalSalesLine: Record "Sales Line"; var SalesLine: Record "Sales Line"; var xSalesLine: Record "Sales Line")
    begin
        TotalSalesLine.Quantity += SalesLine."Quantity" - xSalesLine."Quantity";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnAfterCalculateSalesSubPageTotals', '', false, false)]
    local procedure DocumentTotals_OnAfterCalculateSalesSubPageTotals(var TotalSalesLine2: Record "Sales Line")
    begin
        TotalSalesLine2.CalcSums(Quantity);
    end;
}
