page 60041 "House Interface Test_TNG"
{
    Caption = 'House Interface Test';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AndrewHouse)
            {
                ApplicationArea = All;
                Caption = 'Andrew House';
                ToolTip = 'Andrew House.';
                Image = HumanResources;

                trigger OnAction()
                var
                    HouseInterface: Interface HouseInterface_TNG;
                    House: Enum House_TNG;
                begin
                    HouseInterface := House::Andrew;
                    ShowHouseDetail(HouseInterface);
                end;
            }
            action(JohnHouse)
            {
                ApplicationArea = All;
                Caption = 'John House';
                ToolTip = 'John House.';
                Image = HumanResources;

                trigger OnAction()
                var
                    House: Enum House_TNG;
                begin
                    ShowHouseDetail(House::John);
                end;
            }
            action(MatthewHouse)
            {
                ApplicationArea = All;
                Caption = 'Matthew House';
                ToolTip = 'Matthew House.';
                Image = HumanResources;

                trigger OnAction()
                begin
                    ShowHouseDetail(Enum::House_TNG::Matthew);
                end;
            }
            action(PeterHouse)
            {
                ApplicationArea = All;
                Caption = 'Peter House';
                ToolTip = 'Peter House.';
                Image = HumanResources;

                trigger OnAction()
                var
                    House: Enum House_TNG;
                begin
                    ShowHouseDetail(House::Peter);
                end;
            }
        }
    }

    local procedure ShowHouseDetail(HouseInterface: Interface HouseInterface_TNG)
    begin
        Message(HouseInterface.GetHouseAddress() + '\' + HouseInterface.GetHouseColor());
    end;
}
