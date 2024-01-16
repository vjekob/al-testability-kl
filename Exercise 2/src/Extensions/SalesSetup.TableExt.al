namespace Demo.Exercise2;

using Microsoft.Sales.Setup;

tableextension 50200 SalesSetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(60100; PostingRoutine; Enum PostingRoutine)
        {
            Caption = 'Posting Routine';
            DataClassification = CustomerContent;
        }
    }
}
