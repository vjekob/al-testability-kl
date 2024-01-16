codeunit 60155 FakePetSpy
{
    EventSubscriberInstance = Manual;

    var
        _invoked: Boolean;

    procedure IsInvoked(): Boolean
    begin
        exit(_invoked);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::FakePet, 'OnMakeSound', '', false, false)]
    local procedure OnMakeSound()
    begin
        _invoked := true;
    end;
}
