codeunit 60153 FakePet implements IPet
{
    procedure MakeSound();
    begin
        OnMakeSound();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnMakeSound()
    begin
    end;
}
