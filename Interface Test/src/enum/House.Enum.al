enum 60041 "House_TNG" implements HouseInterface_TNG
{
    Extensible = true;

    value(0; Andrew)
    {
        Caption = 'Andrew';
        Implementation = HouseInterface_TNG = AndrewHouse_TNG;
    }
    value(1; Matthew)
    {
        Caption = 'Matthew';
        Implementation = HouseInterface_TNG = MatthewHouse_TNG;
    }
    value(2; John)
    {
        Caption = 'John';
        Implementation = HouseInterface_TNG = JohnHouse_TNG;
    }
    value(3; Peter)
    {
        Caption = 'Peter';
        Implementation = HouseInterface_TNG = PeterHouse_TNG;
    }
}
