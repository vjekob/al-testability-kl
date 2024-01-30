namespace Demo.Doubles;

codeunit 50112 DatabaseLogger implements ILogger
{
    procedure Log(FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal; User: Text[50]);
    var
        ExchangeLog: Record CurrencyExchangeLog;
    begin
        AssignValues(ExchangeLog, FromCurrencyCode, ToCurrencyCode, FromAmount, ToAmount, User);
        ExchangeLog.Insert();
    end;

    internal procedure AssignValues(var ExchangeLog: Record CurrencyExchangeLog; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal; User: Text[50])
    begin
        ExchangeLog."Date and Time" := CurrentDateTime;
        ExchangeLog."User ID" := User;
        ExchangeLog."From Currency Code" := FromCurrencyCode;
        ExchangeLog."To Currency Code" := ToCurrencyCode;
        ExchangeLog."From Amount" := FromAmount;
        ExchangeLog."To Amount" := ToAmount;
    end;
}
