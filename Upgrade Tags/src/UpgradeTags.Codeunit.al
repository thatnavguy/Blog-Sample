codeunit 60091 "Upgrade Tags_TNG"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        MyUpgradeProcedure();
    end;

    procedure MyUpgradeProcedure()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(MyUpgradeProcedureTagLbl) then exit;

        //Do something

        UpgradeTag.SetUpgradeTag(MyUpgradeProcedureTagLbl);
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(MyUpgradeProcedureTagLbl);
    end;


    var

        MyUpgradeProcedureTagLbl: Label 'TNG-0001-DoSomething-20230624';
}
