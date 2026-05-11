codeunit 60062 "Pragma Clean25"
{
#if CLEAN25
#endif

    procedure DoSomething()
    begin
#if CLEAN25
        ;
# else
        ;
#endif
    end;
}
