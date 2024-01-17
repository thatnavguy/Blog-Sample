codeunit 60241 "Subs Multi Approval Admin_TNG"
{
    [EventSubscriber(ObjectType::Table, Database::"User Setup", OnBeforeValidateApprovalAdministrator, '', false, false)]
    local procedure UserSetup_OnBeforeValidateApprovalAdministrator(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
}
