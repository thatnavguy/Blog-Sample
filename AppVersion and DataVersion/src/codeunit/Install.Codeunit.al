codeunit 60081 "Install_TNG"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        AppVersion: Record "App Version_TNG";
    begin
        AppVersion.InsertVersion('Install Codeunit');
    end;
}
