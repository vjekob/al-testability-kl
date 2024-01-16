codeunit 50145 SourceTypeFake implements ISourceType
{
    procedure Initialize(No: Code[20]);
    begin
    end;

    procedure ValidateRequirements();
    begin
        OnBeforeValidateRequirements();
    end;

    procedure AcceptsLineType(LineType: enum LineType): Boolean;
    begin
        OnBeforeAcceptsLineType(LineType);
        exit(true);
    end;

    procedure AcceptsQuantity(LineType: enum LineType; Quantity: Decimal): Boolean;
    begin
        OnBeforeAcceptsQuantity(LineType, Quantity);
        exit(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateRequirements();
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAcceptsLineType(var LineType: enum LineType);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAcceptsQuantity(var LineType: enum LineType; var Quantity: Decimal);
    begin
    end;
}
