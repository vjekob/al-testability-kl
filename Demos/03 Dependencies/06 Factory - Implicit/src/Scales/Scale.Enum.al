namespace Demo.Scales;

enum 50100 Scale implements IScale
{
    Caption = 'Scale';

    value(0; Tefal)
    {
        Caption = 'Tefal';
        Implementation = IScale = ScaleTefal;
    }

    value(1; BTek)
    {
        Caption = 'B-TEK';
        Implementation = IScale = ScaleBTek;
    }

    value(2; MettlerToledo)
    {
        Caption = 'Mettler Toledo';
        Implementation = IScale = ScaleMettlerToledo;
    }
}
