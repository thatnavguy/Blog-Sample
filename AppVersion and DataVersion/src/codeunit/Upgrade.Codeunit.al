codeunit 60082 "Upgrade_TNG"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        AppVersion: Record "App Version_TNG";
        CurrModuleInfo: ModuleInfo;
    begin
        NAVApp.GetCurrentModuleInfo(CurrModuleInfo);
        PerformDataMigrationWhenComingFromV2(CurrModuleInfo);
        CheckUpgradeMustComeFromV3(CurrModuleInfo);
        AppVersion.InsertVersion('Upgrade Codeunit');
    end;

    procedure PerformDataMigrationWhenComingFromV2(CurrModuleInfo: ModuleInfo)
    var
        AppVersion: Record "App Version_TNG";
    begin
        //Only do data migration when upgrading from version 2 and below
        if CurrModuleInfo.DataVersion.Major > 2 then
            exit;

        AppVersion.InsertVersion('Do Data Migration');
    end;

    procedure CheckUpgradeMustComeFromV3(CurrModuleInfo: ModuleInfo)
    begin
        if CurrModuleInfo.DataVersion.Major < 3 then
            Error('Please upgrade to version 3 first.');
    end;
}
