namespace Demo.Doubles;

codeunit 50104 StubConversion implements ICurrencyConverter
{
    procedure Convert(AtDate: Date; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; Amount: Decimal): Decimal;
    begin
        exit(-Amount * 2);
    end;
}
