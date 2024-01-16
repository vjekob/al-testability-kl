codeunit 50142 TestDemoJournalLine
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        LibrarySales: Codeunit "Library - Sales";
        Assert: Codeunit Assert;

    [Test]
    procedure Test_SourceNo_InvokesValidation()
    var
        JnlLine: Record DemoJournalLine;
        Spy: Codeunit SourceTypeSpy;
    begin
        // [GIVEN] A document header

        // [WHEN] Selecting a source
        BindSubscription(Spy);
        JnlLine.SourceType := SourceType::Fake;
        JnlLine.Validate(SourceNo, 'fake');
        UnbindSubscription(Spy);

        // [THEN] Validation must have been invoked
        Assert.IsTrue(Spy.OnBeforeValidateRequirementsInvoked(), 'Validation was not invoked');
    end;

}
