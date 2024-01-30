namespace Demo.Doubles;

using System.Security.AccessControl;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Foundation.NoSeries;

table 50102 ConversionHeader
{
    Caption = 'Conversion Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Rec.No = xRec.No then
                    exit;

                InitializeSetup();

                NoSeriesMgt.TestManual(Setup.ConversionNos);
                Rec.NoSeries := '';
            end;
        }

        field(2; DocumentDate; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }

        field(3; CustomerNo; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }

        field(4; UserName; Code[50])
        {
            Caption = 'User No.';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
        }

        field(5; NoSeries; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(6; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PrimaryKey; No)
        {
            Clustered = true;
        }
    }

    var
        Setup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SetupInitialized: Boolean;

    trigger OnInsert()
    begin
        InitNoSeries(Rec, xRec);
    end;

    local procedure InitializeSetup()
    begin
        if SetupInitialized then
            exit;

        Setup.Get();
        Setup.TestField(ConversionNos);
    end;

    local procedure InitNoSeries(var Rec: Record ConversionHeader; var xRec: Record ConversionHeader)
    begin
        if Rec.No <> '' then
            exit;

        InitializeSetup();
        NoSeriesMgt.InitSeries(Setup.ConversionNos, xRec.NoSeries, WorkDate(), Rec.No, Rec.NoSeries);
    end;

    procedure AssistEdit(var Rec: Record ConversionHeader; var xRec: Record ConversionHeader) Result: Boolean
    begin
        InitializeSetup();
        if NoSeriesMgt.SelectSeries(Setup.ConversionNos, xRec.NoSeries, Rec.NoSeries) then begin
            NoSeriesMgt.SetSeries(Rec.No);
            exit(true);
        end;
    end;
}
