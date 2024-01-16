namespace Demo.Scales;

using Microsoft.Sales.Setup;

tableextension 50101 SalesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; ScaleType; Enum Scale)
        {
            Caption = 'Scale Type';
        }
    }
}
