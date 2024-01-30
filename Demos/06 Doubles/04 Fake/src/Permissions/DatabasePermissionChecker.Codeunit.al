namespace Demo.Doubles;

codeunit 50111 DatabasePermissionChecker implements IPermissionChecker
{
    procedure CanConvert(FromCurrencyCode: Code[20]; ToCurrencyCode: Code[20]; User: Text[50]): Boolean;
    var
        Permission: Record CurrencyExchangePermission;
    begin
        SetFilters(Permission, FromCurrencyCode, ToCurrencyCode, User);
        exit(not Permission.IsEmpty());
    end;

    internal procedure SetFilters(var Permission: Record CurrencyExchangePermission; FromCurrencyCode: Code[20]; ToCurrencyCode: Code[20]; User: Text[50])
    begin
        Permission.SetRange("User ID", User);
        Permission.SetFilter("From Currency Code", '%1|%2', '', FromCurrencyCode);
        Permission.SetFilter("To Currency Code", '%1|%2', '', ToCurrencyCode);
    end;
}
