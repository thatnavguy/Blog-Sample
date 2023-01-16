codeunit 60041 "AndrewHouse_TNG" implements "HouseInterface_TNG"
{

    procedure GetHouseAddress(): Text
    begin
        exit('Andrew Street 123');
    end;

    procedure GetHouseColor(): Text
    begin
        exit('Red');
    end;

}
