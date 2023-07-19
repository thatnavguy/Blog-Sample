codeunit 60101 "List Sample_TNG"
{
    //Use Temporary Item record to store unique item numbers
    procedure GetItemNoFromSalesLine(SalesLine: Record "Sales Line"; var TempItem: Record Item temporary)
    begin
        SalesLine.FindSet();
        repeat
            if not TempItem.Get(SalesLine."No.") then begin
                TempItem.Init();
                TempItem."No." := SalesLine."No.";
                TempItem.Insert();
            end;
        until SalesLine.Next() = 0;
    end;

    //Use List to store unique item numbers
    procedure GetItemNoFromSalesLine(SalesLine: Record "Sales Line"; var ItemList: List of [Code[20]])
    begin
        SalesLine.FindSet();
        repeat
            if not ItemList.Contains(SalesLine."No.") then
                ItemList.Add(SalesLine."No.");
        until SalesLine.Next() = 0;
    end;

    procedure GetFirstIndexSample()
    var
        ItemList: List of [Code[20]];
    begin
        ItemList.Add('A');
        ItemList.Add('B');
        Message(ItemList.Get(1));
    end;

    procedure NestedListSample()
    var
        IntegerList: List of [Integer];
        NestedList: List of [List of [Integer]];
    begin
        IntegerList.Add(1);
        IntegerList.Add(2);
        NestedList.Add(IntegerList);
    end;

    procedure StoreDuplicateValuesSample()
    var
        FruitList: List of [Text];
        Fruit: Text;
    begin
        FruitList.Add('Apple');
        FruitList.Add('Apple');
        FruitList.Add('Apple');

        foreach Fruit in FruitList do
            Message(Fruit); //all results in Apple
    end;

    procedure ListSequenceSample()
    var
        FruitList: List of [Text];
        Fruit: Text;
    begin
        FruitList.Add('Apple');
        FruitList.Add('Orange');
        FruitList.Add('Apple');

        foreach Fruit in FruitList do
            Message(Fruit); //Result in Apple, Orange, Apple
    end;

    procedure AddSample()
    var
        FruitList: List of [Text];
    begin
        FruitList.Add('Apple');
        FruitList.Add('Banana');
    end;

    procedure AddRangeSample()
    var
        FruitList: List of [Text];
        Fruit: Text;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Orange');
        foreach Fruit in FruitList do
            Message(Fruit);
    end;

    procedure ContainsSample()
    var
        FruitList: List of [Text];
    begin
        FruitList.AddRange('Apple', 'Banana', 'Orange');

        if FruitList.Contains('Banana') then
            Message('Banana is in the list');
    end;

    procedure CountSample()
    var
        FruitList: List of [Text];
    begin
        FruitList.AddRange('Apple', 'Banana', 'Orange');

        Message('Fruit Count %1', FruitList.Count());
    end;

    procedure GetSample()
    var
        FruitList: List of [Text];
    begin
        FruitList.AddRange('Apple', 'Banana', 'Orange');

        Message('Second Index %1', FruitList.Get(2));
        Message('Fourth Index %1', FruitList.Get(4)); //Result in error An invalid argument was passed to a 'List' data type method
    end;

    procedure GetRangeSample()
    var
        FruitList: List of [Text];
        OtherFruitList: List of [Text];
        Fruit: Text;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Orange', 'Pineapple', 'Mango', 'Grapes', 'Watermelon', 'Strawberry', 'Kiwi');

        OtherFruitList := FruitList.GetRange(2, 5); //Get 5 items starting from index 2

        foreach Fruit in OtherFruitList do
            Message(Fruit); //Result in Banana, Orange, Pineapple, Mango, Grapes
    end;

    procedure GetRangeReferenceSample()
    var
        FruitList: List of [Text];
        OtherFruitList: List of [Text];
        Fruit: Text;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Orange', 'Pineapple', 'Mango', 'Grapes', 'Watermelon', 'Strawberry', 'Kiwi');

        OtherFruitList := FruitList.GetRange(2, 5); //Get 5 items starting from index 2

        foreach Fruit in OtherFruitList do
            Message(Fruit); //Result in Banana, Orange, Pineapple, Mango, Grapes
    end;

    procedure IndexOfSample()
    var
        FruitList: List of [Text];
        Index: Integer;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Apple', 'Pineapple', 'Mango');

        Index := FruitList.IndexOf('Apple');

        Message('Index of Apple %1', Index); //Result in 1
    end;

    procedure LastIndexOfSample()
    var
        FruitList: List of [Text];
        Index: Integer;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Apple', 'Apple', 'Mango');

        Index := FruitList.LastIndexOf('Apple');

        Message('Last Index of Apple %1', Index); //Result in 4
    end;

    procedure RemoveSample()
    var
        FruitList: List of [Text];
        Fruit: Text;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Apple', 'Apple', 'Mango');

        FruitList.Remove('Apple');

        foreach Fruit in FruitList do
            Message(Fruit); //Result in Banana, Apple, Apple, Mango

        Message('%1', FruitList.Remove('Kiwi')); //Result in false
    end;

    procedure ReverseSample()
    var
        FruitList: List of [Text];
        Fruit: Text;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Pineapple', 'Mango', 'Grapes');

        FruitList.Reverse();

        foreach Fruit in FruitList do
            Message(Fruit); //Result in Grapes, Mango, Pineapple, Banana, Apple
    end;

    procedure SetSample()
    var
        FruitList: List of [Text];
        Fruit: Text;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Pineapple', 'Mango', 'Grapes');

        FruitList.Set(3, 'Orange');

        foreach Fruit in FruitList do
            Message(Fruit); //Result in Apple, Banana, Orange, Mango, Grapes

        FruitList.Set(6, 'Kiwi'); //Result in error An invalid argument was passed to a 'List' data type method
    end;

    procedure PassReferenceSample()
    var
        FruitList: List of [Text];
        FruitList2: List of [Text];
        Fruit: Text;
    begin
        FruitList.AddRange('Apple', 'Banana', 'Pineapple', 'Mango', 'Grapes');

        FruitList2 := FruitList; //pass by reference

        DeleteApple(FruitList);

        foreach Fruit in FruitList do
            Message(Fruit); //Result in Banana, Pineapple, Mango, Grapes

        foreach Fruit in FruitList2 do
            Message(Fruit); //Also result in Banana, Pineapple, Mango, Grapes
    end;

    procedure DeleteApple(FruitList: List of [Text]) //pass by reference without specifying var
    begin
        FruitList.Remove('Apple'); //because it always passes by reference, the original list will be modified as well
    end;

}
