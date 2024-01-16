codeunit 50142 TestDemoJournalLine
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        LibrarySales: Codeunit "Library - Sales";
        Assert: Codeunit Assert;

    [Test]
    procedure Test_SourceCustomer_Blocked_Fails()
    var
        Customer: Record Customer;
        JnlLine: Record DemoJournalLine;
    begin
        // [GIVEN] A blocked customer
        LibrarySales.CreateCustomer(Customer);
        Customer.Blocked := "Customer Blocked"::All;
        Customer.Modify();

        // [WHEN] Selecting the customer on a journal line
        JnlLine.SourceType := SourceType::Customer;
        asserterror JnlLine.Validate(SourceNo, Customer."No.");

        // [THEN] Testfield error must have occurred
        Assert.ExpectedErrorCode('TestField');
    end;

    [Test]
    procedure Test_SourceCustomer_NoCustomerPostingGroup_Fails()
    var
        Customer: Record Customer;
        JnlLine: Record DemoJournalLine;
    begin
        // [GIVEN] A customer without customer posting group
        LibrarySales.CreateCustomer(Customer);
        Customer."Customer Posting Group" := '';
        Customer.Modify();

        // [WHEN] Selecting the customer on a journal line
        JnlLine.SourceType := SourceType::Customer;
        asserterror JnlLine.Validate(SourceNo, Customer."No.");

        // [THEN] Testfield error must have occurred
        Assert.ExpectedErrorCode('TestField');
    end;

    [Test]
    procedure Test_SourceCustomer_NoGenBusPostingGroup_Fails()
    var
        Customer: Record Customer;
        JnlLine: Record DemoJournalLine;
    begin
        // [GIVEN] A customer without general business posting group
        LibrarySales.CreateCustomer(Customer);
        Customer."Gen. Bus. Posting Group" := '';
        Customer.Modify();

        // [WHEN] Selecting the customer on a journal line
        JnlLine.SourceType := SourceType::Customer;
        asserterror JnlLine.Validate(SourceNo, Customer."No.");

        // [THEN] Testfield error must have occurred
        Assert.ExpectedErrorCode('TestField');
    end;

    [Test]
    procedure Test_SourceCustomer_NoVATRegistrationNo_Fails()
    var
        Customer: Record Customer;
        JnlLine: Record DemoJournalLine;
    begin
        // [GIVEN] A customer without VAT registration no.
        LibrarySales.CreateCustomer(Customer);

        // [WHEN] Selecting the customer on a journal line
        JnlLine.SourceType := SourceType::Customer;
        asserterror JnlLine.Validate(SourceNo, Customer."No.");

        // [THEN] Testfield error must have occurred
        Assert.ExpectedErrorCode('TestField');
    end;

    [Test]
    procedure Test_SourceCustomer_Succeeds()
    var
        Customer: Record Customer;
        JnlLine: Record DemoJournalLine;
    begin
        // [GIVEN] A fully-configured customer
        LibrarySales.CreateCustomer(Customer);
        Customer."VAT Registration No." := 'fake';
        Customer.Modify();

        // [WHEN] Selecting the customer on a journal line
        JnlLine.SourceType := SourceType::Customer;
        JnlLine.Validate(SourceNo, Customer."No.");

        // [THEN] No error must have occurred
    end;
}