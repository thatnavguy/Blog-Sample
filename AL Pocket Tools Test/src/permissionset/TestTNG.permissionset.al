permissionset 60061 TestTNG
{
    Assignable = true;
    Permissions = tabledata MyTableTNG = RIMD,
        table MyTableTNG = X,
        report SalesInvoice_TNG = X,
        codeunit ALSetLoadFields_TNG = X,
        codeunit "Pragma Clean25" = X,
        codeunit "Pragma Multiple" = X,
        codeunit "Pragma Warning Disable" = X,
        codeunit Region_TNG = X;
}