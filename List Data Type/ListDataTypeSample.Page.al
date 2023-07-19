page 60101 "List Data Type Sample_TNG"
{
    Caption = 'List Data Type Sample';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetItemNoFromSalesLine)
            {
                Caption = 'Get Item No. from Sales Line';
                Image = Sales;
                ToolTip = 'Get Item No. from Sales Line';
                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                    TempItem: Record Item temporary;
                    ListSample: Codeunit "List Sample_TNG";
                    ItemList: List of [Code[20]];
                begin
                    ListSample.GetItemNoFromSalesLine(SalesLine, TempItem);
                    ListSample.GetItemNoFromSalesLine(SalesLine, ItemList);
                    Message('Item Count using Temporary Table: %1, Item Count using List: %2', TempItem.Count(), ItemList.Count());
                end;
            }
            action(GetFirstIndexSample)
            {
                Caption = 'Get First Index';
                Image = Find;
                ToolTip = 'Get First Index';
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.GetFirstIndexSample();
                end;
            }
            action(ListSequenceSample)
            {
                Caption = 'List Sequence';
                Image = Process;
                ToolTip = 'List Sequence';
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.ListSequenceSample();
                end;
            }
            action(StoreDuplicateValuesSample)
            {
                Caption = 'Store Duplicate Values';
                Image = Process;
                ToolTip = 'Store Duplicate Values';
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.StoreDuplicateValuesSample();
                end;
            }
            action(AddRangeSample)
            {
                Caption = 'AddRange Sample';
                ToolTip = 'AddRange Sample';
                Image = Process;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.AddRangeSample();
                end;
            }
            action(GetSample)
            {
                Caption = 'Get Sample';
                ToolTip = 'Get Sample';
                Image = Process;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.GetSample();
                end;
            }
            action(GetRangeSample)
            {
                Caption = 'GetRange Sample';
                ToolTip = 'GetRange Sample';
                Image = Process;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.GetRangeSample();
                end;
            }
            action(GetRangeReferenceSample)
            {
                Caption = 'GetRange Reference Sample';
                ToolTip = 'GetRange Reference Sample';
                Image = Process;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.GetRangeReferenceSample();
                end;
            }
            action(IndexOfSample)
            {
                Caption = 'IndexOf Sample';
                ToolTip = 'IndexOf Sample';
                Image = Process;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.IndexOfSample();
                end;
            }
            action(LastIndexOfSample)
            {
                Caption = 'LastIndexOf Sample';
                ToolTip = 'LastIndexOf Sample';
                Image = Process;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.LastIndexOfSample();
                end;
            }
            action(RemoveSample)
            {
                Caption = 'Remove Sample';
                ToolTip = 'Remove Sample';
                Image = RemoveLine;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.RemoveSample();
                end;
            }
            action(ReverseSample)
            {
                Caption = 'Reverse Sample';
                ToolTip = 'Reverse Sample';
                Image = SortDescending;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.ReverseSample();
                end;
            }
            action(SetSample)
            {
                Caption = 'Set Sample';
                ToolTip = 'Set Sample';
                Image = Process;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.SetSample();
                end;
            }
            action(ListReferenceSample)
            {
                Caption = 'Pass Reference Sample';
                ToolTip = 'Pass Reference Sample';
                Image = Process;
                trigger OnAction()
                var
                    ListSample: Codeunit "List Sample_TNG";
                begin
                    ListSample.PassReferenceSample();
                end;
            }
        }
    }
}
