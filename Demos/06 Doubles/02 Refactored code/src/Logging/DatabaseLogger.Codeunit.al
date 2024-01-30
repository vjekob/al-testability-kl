namespace Demo.Doubles;

codeunit 50112 DatabaseLogger implements ILogger
{
    procedure Log(FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal; User: Text[50]);
    var
        ExchangeLog: Record CurrencyExchangeLog;
    begin
        ExchangeLog."Date and Time" := CurrentDateTime;
        ExchangeLog."User ID" := User;
        ExchangeLog."From Currency Code" := FromCurrencyCode;
        ExchangeLog."To Currency Code" := ToCurrencyCode;
        ExchangeLog."From Amount" := FromAmount;
        ExchangeLog."To Amount" := ToAmount;
        ExchangeLog.Insert();
    end;
}
