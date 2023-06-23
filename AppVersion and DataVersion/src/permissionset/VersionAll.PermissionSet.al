permissionset 60081 "Version All_TNG"
{
    Access = Internal;
    Assignable = true;
    Caption = 'All permissions', Locked = true;

    Permissions =
         table "App Version_TNG" = X,
         tabledata "App Version_TNG" = RIMD;
}