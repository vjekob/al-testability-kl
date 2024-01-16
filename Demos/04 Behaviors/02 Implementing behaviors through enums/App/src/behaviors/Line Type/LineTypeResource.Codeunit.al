codeunit 50104 LineTypeResource implements ILineType
{
    var
        _resource: Record Resource;

    procedure Initialize(No: Code[20])
    begin
        _resource.Get(No);
    end;

    procedure ValidateRequirements()
    begin
        _resource.TestField("Gen. Prod. Posting Group");
        _resource.TestField(Blocked, false);
    end;

}
