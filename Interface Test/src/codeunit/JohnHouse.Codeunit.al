codeunit 60042 JohnHouse_TNG implements HouseInterface_TNG
{

    procedure GetHouseAddress(): Text
    begin
        exit('John Drive 9B');
    end;

    procedure GetHouseColor(): Text
    begin
        exit(GetMyHouseColor());
    end;

    local procedure GetMyHouseColor(): Text
    begin
        exit('Yellow');
    end;

}
