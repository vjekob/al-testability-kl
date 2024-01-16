namespace Demo.Scales;

using Microsoft.Sales.Setup;

codeunit 50103 ScaleFactory
{
    procedure GetScale() Scale: Interface IScale
    var
        Setup: Record "Sales & Receivables Setup";
    begin
        Setup.Get();
        Scale := Setup.ScaleType;
    end;
}
