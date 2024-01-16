codeunit 50144 TestCustomerValidation
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit Assert;

    [Test]
    procedure Test_Customer_Blocked_Fails()
    var
        Customer: Record Customer;
        SourceTypeCustomer: Codeunit SourceTypeCustomer;
    begin
        // [GIVEN] A blocked customer
        Customer.Blocked := "Customer Blocked"::All;

        // [WHEN] Validating customer requirements
        SourceTypeCustomer.Initialize(Customer);
        asserterror SourceTypeCustomer.ValidateRequirements();

        // [THEN] Testfield error must have occurred
        Assert.ExpectedErrorCode('TestField');
    end;

    [Test]
    procedure Test_Customer_NoCustomerPostingGroup_Fails()
    var
        Customer: Record Customer;
        SourceTypeCustomer: Codeunit SourceTypeCustomer;
    begin
        // [GIVEN] A customer without customer posting group

        // [WHEN] Validating customer requirements
        SourceTypeCustomer.Initialize(Customer);
        asserterror SourceTypeCustomer.ValidateRequirements();

        // [THEN] Testfield error must have occurred
        Assert.ExpectedErrorCode('TestField');
    end;

    [Test]
    procedure Test_Customer_NoGenBusPostingGroup_Fails()
    var
        Customer: Record Customer;
        SourceTypeCustomer: Codeunit SourceTypeCustomer;
    begin
        // [GIVEN] A customer without general business posting group
        Customer."Customer Posting Group" := 'fake';

        // [WHEN] Validating customer requirements
        SourceTypeCustomer.Initialize(Customer);
        asserterror SourceTypeCustomer.ValidateRequirements();

        // [THEN] Testfield error must have occurred
        Assert.ExpectedErrorCode('TestField');
    end;

    [Test]
    procedure Test_Customer_NoVATRegistrationNo_Fails()
    var
        Customer: Record Customer;
        SourceTypeCustomer: Codeunit SourceTypeCustomer;
    begin
        // [GIVEN] A customer without VAT registration no
        Customer."Customer Posting Group" := 'fake';
        Customer."Gen. Bus. Posting Group" := 'fake';

        // [WHEN] Validating customer requirements
        SourceTypeCustomer.Initialize(Customer);
        asserterror SourceTypeCustomer.ValidateRequirements();

        // [THEN] Testfield error must have occurred
        Assert.ExpectedErrorCode('TestField');
    end;

    [Test]
    procedure Test_Customer_Succeeds()
    var
        Customer: Record Customer;
        SourceTypeCustomer: Codeunit SourceTypeCustomer;
    begin
        // [GIVEN] A fully-configured customer
        Customer."Customer Posting Group" := 'fake';
        Customer."Gen. Bus. Posting Group" := 'fake';
        Customer."VAT Registration No." := 'fake';

        // [WHEN] Validating customer requirements
        SourceTypeCustomer.Initialize(Customer);
        SourceTypeCustomer.ValidateRequirements();

        // [THEN] No error must have occurred
    end;

}