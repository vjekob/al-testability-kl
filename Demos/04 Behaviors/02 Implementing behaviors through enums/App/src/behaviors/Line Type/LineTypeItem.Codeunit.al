codeunit 50103 LineTypeItem implements ILineType
{
    var
        _item: Record Item;

    procedure Initialize(No: Code[20])
    begin
        _item.Get(No);
    end;

    procedure ValidateRequirements()
    begin
        _item.TestField("Gen. Prod. Posting Group");
        _item.TestField("Inventory Posting Group");
        _item.TestField(Blocked, false);
    end;

}
