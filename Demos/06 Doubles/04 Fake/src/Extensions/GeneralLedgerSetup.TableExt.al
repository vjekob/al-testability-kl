namespace Demo.Doubles;

using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50100 GeneralLedgerSetup extends "General Ledger Setup"
{
    fields
    {
        field(50100; ConversionNos; Code[20])
        {
            Caption = 'Conversion Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}
