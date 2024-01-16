namespace Demo.Scales;

codeunit 50103 ScaleFactory
{
    var
        _scale: Interface IScale;
        _scaleDefined: Boolean;

    internal procedure SetScale(Scale: Interface IScale)
    begin
        _scale := Scale;
        _scaleDefined := true;
    end;

    procedure GetScale(): Interface IScale
    var
        DefaultScale: Codeunit ScaleTefal;
    begin
        if _scaleDefined then
            exit(_scale)
        else
            exit(DefaultScale);
    end;
}
