codeunit 60064 "Pragma Multiple"
{
#pragma warning disable AL0002
#pragma warning restore AL0002

    procedure TestMultiplePragmas()
    begin
#pragma warning disable AL0002
        ;
    end;
#pragma warning restore AL0002
}
