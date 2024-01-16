codeunit 50146 SourceTypeSpy
{
    EventSubscriberInstance = Manual;

    var
        _onBeforeValidateRequirementsInvoked: Boolean;
        _onBeforeAcceptsLineTypeInvoked: Boolean;
        _onBeforeAcceptsQuantityInvoked: Boolean;

    procedure OnBeforeValidateRequirementsInvoked(): Boolean
    begin
        exit(_onBeforeValidateRequirementsInvoked);
    end;

    procedure OnBeforeAcceptsLineTypeInvoked(): Boolean
    begin
        exit(_onBeforeAcceptsLineTypeInvoked);
    end;

    procedure OnBeforeAcceptsQuantityInvoked(): Boolean
    begin
        exit(_onBeforeAcceptsQuantityInvoked);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::SourceTypeFake, 'OnBeforeValidateRequirements', '', false, false)]
    local procedure SourceTypeFake_OnBeforeValidateRequirements()
    begin
        _onBeforeValidateRequirementsInvoked := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::SourceTypeFake, 'OnBeforeAcceptsLineType', '', false, false)]
    local procedure SourceTypeFake_OnBeforeAcceptsLineType()
    begin
        _onBeforeAcceptsLineTypeInvoked := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::SourceTypeFake, 'OnBeforeAcceptsQuantity', '', false, false)]
    local procedure SourceTypeFake_OnBeforeAcceptsQuantity()
    begin
        _onBeforeAcceptsQuantityInvoked := true;
    end;

}
