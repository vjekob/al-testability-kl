namespace Demo.Scales;

using Microsoft.Sales.Setup;

codeunit 50103 ScaleFactory
{
    procedure GetScale(): Interface IScale
    var
        Setup: Record "Sales & Receivables Setup";
        ScaleTefal: Codeunit ScaleTefal;
        ScaleBTek: Codeunit ScaleBTek;
        ScaleMettlerToledo: Codeunit ScaleMettlerToledo;
    begin
        Setup.Get();

        case Setup.ScaleType of
            Setup.ScaleType::Tefal:
                exit(ScaleTefal);
            Setup.ScaleType::BTek:
                exit(ScaleBTek);
            Setup.ScaleType::MettlerToledo:
                exit(ScaleMettlerToledo);
        end;
    end;
}
