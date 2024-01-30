namespace Demo.Doubles;

using Microsoft.Finance.Currency;

codeunit 50192 TestCovertCurrency02
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        LibraryERM: Codeunit "Library - ERM";
        Assert: Codeunit Assert;
        ConvertCurrency: Codeunit ConvertCurrency02;

    [Test]
    procedure Component_DatabasePermissionChecker_SetsFilters()
    var
        Permission: Record CurrencyExchangePermission;
        DatabasePermissionChecker: Codeunit DatabasePermissionChecker;
    begin
        // Assemble

        // Act
        DatabasePermissionChecker.SetFilters(Permission, 'DUMMY_FROM', 'DUMMY_TO', 'DUMMY_USER');

        // Assert
        Assert.AreEqual('''''|DUMMY_FROM', Permission.GetFilter("From Currency Code"), 'From Currency Code filter is not set');
        Assert.AreEqual('''''|DUMMY_TO', Permission.GetFilter("To Currency Code"), 'To Currency Code filter is not set');
        Assert.AreEqual('DUMMY_USER', Permission.GetFilter("User ID"), 'User ID filter is not set');
    end;

    [Test]
    procedure Component_DatabaseLogger_AssignsValues()
    var
        CurrencyExchangeLog: Record CurrencyExchangeLog;
        DatabaseLogger: Codeunit DatabaseLogger;
    begin
        // Assemble

        // Act
        DatabaseLogger.AssignValues(CurrencyExchangeLog, 'DUMMY_FROM', 'DUMMY_TO', 1, 2, 'DUMMY_USER');

        // Assert
        Assert.AreEqual('DUMMY_FROM', CurrencyExchangeLog."From Currency Code", 'From Currency Code is not set');
        Assert.AreEqual('DUMMY_TO', CurrencyExchangeLog."To Currency Code", 'To Currency Code is not set');
        Assert.AreEqual(1, CurrencyExchangeLog."From Amount", 'From Amount is not set');
        Assert.AreEqual(2, CurrencyExchangeLog."To Amount", 'To Amount is not set');
        Assert.AreEqual('DUMMY_USER', CurrencyExchangeLog."User ID", 'User ID is not set');
    end;

    [Test]
    procedure ConvertCurrency_HappyPath()
    var
        ConvertCurrency: Codeunit ConvertCurrency02;
        Factory: Codeunit Factory;
        HasPermission: Codeunit StubHasPermission;
        StubConversion: Codeunit StubConversion;
        SpyLogger: Codeunit SpyLogger;
        ReturnValue: Decimal;
    begin
        // Assemble
        Factory.SetPermissionChecker(HasPermission);
        Factory.SetCurrencyConverter(StubConversion);
        Factory.SetLogger(SpyLogger);

        // Act
        ReturnValue := ConvertCurrency.Convert(3, 'DUMMY_FROM', 'DUMMY_TO', Factory);

        // Assert
        Assert.AreEqual(-6, ReturnValue, 'Return value is not correct');
        SpyLogger.AssertLogIsInvokedWith('DUMMY_FROM', 'DUMMY_TO', 3, -6, UserId());
    end;

    [Test]
    procedure ConvertCurrency_NoPermission()
    var
        ConvertCurrency: Codeunit ConvertCurrency02;
        Factory: Codeunit Factory;
        NoPermission: Codeunit StubNoPermission;
        DummyConversion: Codeunit DummyConversion;
        SpyLogger: Codeunit SpyLogger;
    begin
        // Assemble
        Factory.SetPermissionChecker(NoPermission);
        Factory.SetCurrencyConverter(DummyConversion);
        Factory.SetLogger(SpyLogger);

        // Act
        asserterror ConvertCurrency.Convert(3, 'DUMMY_FROM', 'DUMMY_TO', Factory);

        // Assert
        Assert.IsSubstring(GetLastErrorText(), 'Currency exchange is not allowed');
        SpyLogger.AssertLogIsNotInvoked();
    end;
}