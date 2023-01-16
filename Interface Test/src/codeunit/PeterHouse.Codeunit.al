codeunit 60044 PeterHouse_TNG implements HouseInterface_TNG
{
    procedure GetHouseAddress(): Text
    var
        AndrewHouse: Codeunit AndrewHouse_TNG;
    begin
        exit(AndrewHouse.GetHouseAddress());
    end;

    procedure GetHouseColor(): Text
    var
        AndrewHouse: Codeunit AndrewHouse_TNG;
    begin
        exit(AndrewHouse.GetHouseColor());
    end;

}
