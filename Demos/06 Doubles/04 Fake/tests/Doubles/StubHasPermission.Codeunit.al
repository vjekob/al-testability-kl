namespace Demo.Doubles;

codeunit 50102 StubHasPermission implements IPermissionChecker
{
    procedure CanConvert(FromCurrencyCode: Code[20]; ToCurrencyCode: Code[20]; User: Text[50]): Boolean;
    begin
        exit(true);
    end;
}