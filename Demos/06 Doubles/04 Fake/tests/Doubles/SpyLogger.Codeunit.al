namespace Demo.Doubles;

codeunit 50105 SpyLogger implements ILogger
{
    var
        Assert: Codeunit Assert;
        _isInvoked: Boolean;
        _fromCurrencyCode: Code[10];
        _toCurrencyCode: Code[10];
        _fromAmount: Decimal;
        _toAmount: Decimal;
        _user: Text[50];

    procedure Log(FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal; User: Text[50]);
    begin
        _isInvoked := true;
        _fromCurrencyCode := FromCurrencyCode;
        _toCurrencyCode := ToCurrencyCode;
        _fromAmount := FromAmount;
        _toAmount := ToAmount;
        _user := User;
    end;

    procedure AssertLogIsInvoked()
    begin
        Assert.IsTrue(_isInvoked, 'Log is not invoked');
    end;

    procedure AssertLogIsNotInvoked()
    begin
        Assert.IsFalse(_isInvoked, 'Log is invoked');
    end;

    procedure AssertLogIsInvokedWith(FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal; User: Text[50])
    begin
        AssertLogIsInvoked();
        Assert.AreEqual(FromCurrencyCode, _fromCurrencyCode, 'FromCurrencyCode is not equal');
        Assert.AreEqual(ToCurrencyCode, _toCurrencyCode, 'ToCurrencyCode is not equal');
        Assert.AreEqual(FromAmount, _fromAmount, 'FromAmount is not equal');
        Assert.AreEqual(ToAmount, _toAmount, 'ToAmount is not equal');
        Assert.AreEqual(User, _user, 'User is not equal');
    end;
}
