table 50100 DemoJournalLine
{
    Caption = 'Demo Journal Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; LineNo; Integer)
        {
            Caption = 'Line No.';
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

        field(4; LineType; Enum LineType)
        {
            Caption = 'Line Type';

            trigger OnValidate()
            begin
                if ((Rec.SourceType = SourceType::Customer) or (Rec.SourceType = SourceType::Vendor)) and (Rec.LineType = LineType::Item) then
                    Rec.FieldError(SourceType);

                if Rec.SourceType = SourceType::Location then
                    if Rec.LineType <> LineType::Item then
                        Rec.FieldError(Rec.SourceType);
            end;
        }

        field(5; No; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (LineType = const(Item)) Item else
            if (LineType = const(Resource)) Resource else
            if (LineType = const(GLAccount)) "G/L Account";

            trigger OnValidate()
            var
                Item: Record Item;
                Resource: Record Resource;
                GLAccount: Record "G/L Account";
                UnknownLineTypeErr: Label 'Unknown source type: %1.';
                IsHandled: Boolean;
            begin
                if Rec.No = '' then
                    exit;

                case Rec.LineType of
                    LineType::Item:
                        begin
                            Item.Get(Rec.SourceNo);
                            Item.TestField("Gen. Prod. Posting Group");
                            Item.TestField("Inventory Posting Group");
                            Item.TestField(Blocked, false);
                        end;

                    LineType::Resource:
                        begin
                            Resource.Get(Rec.SourceNo);
                            Resource.TestField("Gen. Prod. Posting Group");
                            Resource.TestField(Blocked, false);
                        end;

                    LineType::GLAccount:
                        begin
                            GLAccount.Get(Rec.SourceNo);
                            GLAccount.TestField("Gen. Prod. Posting Group");
                            GLAccount.TestField(Blocked, false);
                            GLAccount.TestField("Account Type", "G/L Account Type"::Posting);
                        end;

                    else begin
                        OnExtendedLineTypeValidate(Rec, IsHandled);
                        if not IsHandled then
                            Error(UnknownLineTypeErr, Rec.LineType);
                    end;
                end;
            end;
        }

        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';

            trigger OnValidate()
            var
                MustNotBeNegativeErr: Label 'must not be negative';
            begin
                if (
                    ((Rec.SourceType = SourceType::Customer) and (Rec.LineType in [LineType::Resource, LineType::GLAccount]))
                    or ((Rec.SourceType = SourceType::Vendor) and (Rec.LineType = LineType::GLAccount))
                    or (Rec.SourceType = SourceType::Location)
                ) and (Rec.Quantity < 0)
                then
                    Rec.FieldError(Quantity, MustNotBeNegativeErr);
            end;
        }

    }

    keys
    {
        key(PrimaryKey; LineNo)
        {
            Clustered = true;
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnExtendedSourceTypeValidate(var DemoJournalLine: Record DemoJournalLine; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnExtendedLineTypeValidate(var DemoJournalLine: Record DemoJournalLine; var IsHandled: Boolean)
    begin
    end;

}
