codeunit 50106 DummyConversion implements ICurrencyConverter
{
    procedure Convert(AtDate: Date; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; Amount: Decimal): Decimal;
    begin
        // Expertly designed to underwhelm.
    end;
}
