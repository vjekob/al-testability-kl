codeunit 50102 SourceTypeLocation implements ISourceType
{
    var
        _location: Record Location;

    procedure Initialize(No: Code[20]);
    begin
        _location.Get(No);
    end;

    procedure ValidateRequirements();
    begin
        _location.TestField("Require Pick", false);
        _location.TestField("Require Put-away", false);
        _location.TestField("Require Receive", false);
        _location.TestField("Require Shipment", false);
    end;


    procedure AcceptsLineType(LineType: Enum LineType): Boolean;
    var
        Accepts: Boolean;
        IsHandled: Boolean;
    begin
        if LineType = LineType::Item then
            exit(true);

        OnAcceptsLineType(LineType, Accepts, IsHandled);
        if IsHandled then
            exit(Accepts);

        exit(false);
    end;

    procedure AcceptsQuantity(LineType: enum LineType; Quantity: Decimal): Boolean;
    begin
        exit(Quantity >= 0);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAcceptsLineType(LineType: Enum LineType; var Accepts: Boolean; var IsHandled: Boolean)
    begin
    end;

}
