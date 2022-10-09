page 60011 "Web Service Key Removal_TNG"
{
    Caption = 'Web Service Access Key Removal';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
        }
    }

    actions
    {
        area(Processing)
        {
            action(RemovaAllExistingWebServiceKey)
            {
                ApplicationArea = All;
                Caption = 'Remove All Keys';
                ToolTip = 'Remova all existing web service access keys.';
                trigger OnAction()
                var
                    User: Record User;
                    UserCard: Page "User Card";
                    RemoveQst: Label 'This will search all users and remove all existing web service access keys. Do you want to continue ?';
                    RemovedMsg: Label 'All Web Service Access Keys have been removed.';
                begin
                    If not Confirm(RemoveQst, true) then
                        exit;

                    User.FindSet();
                    repeat
                        UserCard.RemoveWebServiceAccessKey(User."User Security ID");
                    until User.Next() = 0;

                    Message(RemovedMsg);
                end;
            }
        }
    }
}
