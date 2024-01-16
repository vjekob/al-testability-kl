table 50102 DemoDocumentHeader
{
    Caption = 'Demo Document Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No.';
        }

        field(2; SourceType; Enum SourceType)
        {
            Caption = 'Source Type';
        }

        field(3; SourceNo; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = if (SourceType = const(Customer)) Customer else
            if (SourceType = const(Vendor)) Vendor else
            if (SourceType = const(Location)) Location;

            trigger OnValidate()
            var
                Customer: Record Customer;
                Vendor: Record Vendor;
                Location: Record Location;
                Setup: Record DemoSetup;
                MaximumBalanceExceededErr: Label 'Customer %1 exceeded the maximum allowed balance for demo journal.';
                UnknownSourceTypeErr: Label 'Unknown source type: %1.';
                IsHandled: Boolean;
            begin
                if Rec.SourceNo = '' then
                    exit;

                case Rec.SourceType of
                    SourceType::Customer:
                        begin
                            Customer.Get(Rec.SourceNo);
                            Customer.TestField(Blocked, "Customer Blocked"::" ");
                            Customer.TestField("Customer Posting Group");
                            Customer.TestField("Gen. Bus. Posting Group");
                            Customer.TestField("VAT Registration No.");

                            Setup.GetSetup();
                            Customer.CalcFields("Balance Due");
                            if Customer."Balance Due" > Setup.MaximumBalance then
                                Error(MaximumBalanceExceededErr, Customer."No.");
                        end;

                    SourceType::Vendor:
                        begin
                            Vendor.Get(Rec.SourceNo);
                            Vendor.TestField(Blocked, "Vendor Blocked"::" ");
                            Vendor.TestField("Vendor Posting Group");
                            Vendor.TestField("Gen. Bus. Posting Group");
                            Vendor.TestField("VAT Registration No.");
                        end;

                    SourceType::Location:
                        begin
                            Location.Get(Rec.SourceNo);
                            Location.TestField("Require Pick", false);
                            Location.TestField("Require Put-away", false);
                            Location.TestField("Require Receive", false);
                            Location.TestField("Require Shipment", false);
                        end;

                    else begin
                        OnExtendedSourceTypeValidate(Rec, IsHandled);
                        if not IsHandled then
                            Error(UnknownSourceTypeErr, SourceType);
                    end;
                end;
            end;
        }

    }

    keys
    {
        key(PrimaryKey; No)
        {
            Clustered = true;
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnExtendedSourceTypeValidate(var DemoDocumentHeader: Record DemoDocumentHeader; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnExtendedLineTypeValidate(var DemoJournalLine: Record DemoJournalLine; var IsHandled: Boolean)
    begin
    end;

}
