namespace Demo.Scales;

codeunit 50103 ScaleFactory
{
    procedure GetScale() Scale: Interface IScale
    var
        DefaultScale: Codeunit ScaleTefal;
        IsDiscovered: Boolean;
    begin
        OnDiscoverScale(Scale, IsDiscovered);
        if IsDiscovered then
            exit;

        Scale := DefaultScale;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnDiscoverScale(var Scale: Interface IScale; var IsDiscovered: Boolean)
    begin
    end;
}
