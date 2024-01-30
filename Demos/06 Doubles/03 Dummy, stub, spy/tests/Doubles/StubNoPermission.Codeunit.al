namespace Demo.Doubles;

codeunit 50103 StubNoPermission implements IPermissionChecker
{
    procedure CanConvert(FromCurrencyCode: Code[20]; ToCurrencyCode: Code[20]; User: Text[50]): Boolean;
    begin
        exit(false);
    end;
}
