permissionset 60061 "Test Persistent Blob"
{
    Assignable = true;
    Caption = 'Test Persistent Blob', MaxLength = 30;
    Permissions =
        table "Test Persistent Blob_TNG" = X,
        tabledata "Test Persistent Blob_TNG" = RMID,
        page "Test Persistent Blob_TNG" = X;
}
