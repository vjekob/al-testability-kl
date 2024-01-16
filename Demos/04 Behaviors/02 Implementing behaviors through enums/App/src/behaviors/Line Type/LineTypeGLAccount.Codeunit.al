codeunit 50105 LineTypeGLAccount implements ILineType
{
    var
        _glAccount: Record "G/L Account";

    procedure Initialize(No: Code[20])
    begin
        _glAccount.Get(No);
    end;

    procedure ValidateRequirements()
    begin
        _glAccount.TestField("Gen. Prod. Posting Group");
        _glAccount.TestField(Blocked, false);
        _glAccount.TestField("Account Type", "G/L Account Type"::Posting);
    end;

}
