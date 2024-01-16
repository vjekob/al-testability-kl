codeunit 50143 TestDemoDocumentHeader
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        LibrarySales: Codeunit "Library - Sales";
        Assert: Codeunit Assert;

    [Test]
    procedure Test_SourceNo_InvokesValidation()
    var
        DocHeader: Record DemoDocumentHeader;
        Spy: Codeunit SourceTypeSpy;
    begin
        // [GIVEN] A document header

        // [WHEN] Selecting a source
        BindSubscription(Spy);
        DocHeader.SourceType := SourceType::Fake;
        DocHeader.Validate(SourceNo, 'fake');
        UnbindSubscription(Spy);

        // [THEN] Validation must have been invoked
        Assert.IsTrue(Spy.OnBeforeValidateRequirementsInvoked(), 'Validation was not invoked');
    end;

}
