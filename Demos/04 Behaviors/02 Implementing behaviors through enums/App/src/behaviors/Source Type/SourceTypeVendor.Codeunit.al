codeunit 50101 SourceTypeVendor implements ISourceType
{
    var
        _vendor: Record Vendor;

    procedure Initialize(No: Code[20]);
    begin
        _vendor.Get(No);
    end;

    procedure ValidateRequirements();
    begin
        _vendor.TestField(Blocked, "Vendor Blocked"::" ");
        _vendor.TestField("Vendor Posting Group");
        _vendor.TestField("Gen. Bus. Posting Group");
        _vendor.TestField("VAT Registration No.");
    end;

    procedure AcceptsLineType(LineType: Enum LineType): Boolean;
    var
        Accepts: Boolean;
        IsHandled: Boolean;
    begin
        if LineType in [LineType::GLAccount, LineType::Resource] then
            exit(true);

        OnAcceptsLineType(LineType, Accepts, IsHandled);
        if IsHandled then
            exit(Accepts);

        exit(false);
    end;

    procedure AcceptsQuantity(LineType: enum LineType; Quantity: Decimal): Boolean;
    begin
        if LineType = LineType::Resource then
            exit(true);

        exit(Quantity >= 0);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAcceptsLineType(LineType: Enum LineType; var Accepts: Boolean; var IsHandled: Boolean)
    begin
    end;

}
