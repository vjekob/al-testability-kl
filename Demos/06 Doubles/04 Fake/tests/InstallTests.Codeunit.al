codeunit 50190 "DEM Install Tests"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        SetupTestSuite();
    end;

    procedure SetupTestSuite()
    var
        ALTestSuite: Record "AL Test Suite";
        TestSuiteMgt: Codeunit "Test Suite Mgt.";
        SuiteName: Code[10];
        ModInfo: ModuleInfo;
        ObjectRange: Text;
    begin
        ObjectRange := '50001..69999';
        NavApp.GetCurrentModuleInfo(ModInfo);
        SuiteName := 'TESTS';

        if not ALTestSuite.Get(SuiteName) then begin
            TestSuiteMgt.CreateTestSuite(SuiteName);
            Commit();
        end;

        RemoveExistingTestsFromSuiteByApp(SuiteName, ObjectRange);

        ALTestSuite.Get(SuiteName);
        TestSuiteMgt.SelectTestMethodsByRange(ALTestSuite, ObjectRange);
    end;

    local procedure RemoveExistingTestsFromSuiteByApp(SuiteName: Code[10]; ObjectRangeFilter: Text)
    var
        TestMethodLine: Record "Test Method Line";
    begin
        TestMethodLine.SetRange("Test Suite", SuiteName);
        TestMethodLine.SetFilter("Test Codeunit", ObjectRangeFilter);
        if not TestMethodLine.IsEmpty() then
            TestMethodLine.DeleteAll(true);
    end;
}
