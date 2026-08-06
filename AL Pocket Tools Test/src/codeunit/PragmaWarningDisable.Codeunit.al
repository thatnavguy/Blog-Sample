#pragma warning disable AA0247
codeunit 60065 "Pragma Warning Disable"
{

    procedure IgnoreAL0001()
    begin
#pragma warning disable AL0001
        ;
#pragma warning restore AL0001
    end;
}
#pragma warning restore AA0247