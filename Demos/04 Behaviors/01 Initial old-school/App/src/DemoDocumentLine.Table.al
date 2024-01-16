table 50103 DemoDocumentLine
{
    Caption = 'Demo Document Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; DocumentNo; Code[20])
        {
            Caption = 'Document No.';
        }

        field(2; LineNo; Integer)
        {
            Caption = 'Line No.';
        }

        field(3; LineType; Enum LineType)
        {
            Caption = 'Line Type';

            trigger OnValidate()
            begin
                GetDocumentHeader();

                if ((DocumentHeader.SourceType = SourceType::Customer) or (DocumentHeader.SourceType = SourceType::Vendor)) and (Rec.LineType = LineType::Item) then
                    Rec.FieldError(LineType);

                if DocumentHeader.SourceType = SourceType::Location then
                    if Rec.LineType <> LineType::Item then
                        Rec.FieldError(LineType);
            end;
        }

        field(4; No; Code[20])
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
                            Item.Get(Rec.No);
                            Item.TestField("Gen. Prod. Posting Group");
                            Item.TestField("Inventory Posting Group");
                            Item.TestField(Blocked, false);
                        end;

                    LineType::Resource:
                        begin
                            Resource.Get(Rec.No);
                            Resource.TestField("Gen. Prod. Posting Group");
                            Resource.TestField(Blocked, false);
                        end;

                    LineType::GLAccount:
                        begin
                            GLAccount.Get(Rec.No);
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

        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';

            trigger OnValidate()
            var
                MustNotBeNegativeErr: Label 'must not be negative';
            begin
                if (
                    ((DocumentHeader.SourceType = SourceType::Customer) and (Rec.LineType in [LineType::Resource, LineType::GLAccount]))
                    or ((DocumentHeader.SourceType = SourceType::Vendor) and (Rec.LineType = LineType::GLAccount))
                    or (DocumentHeader.SourceType = SourceType::Location)
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

    var
        DocumentHeader: Record DemoDocumentHeader;
        LastDocumentNo: Code[20];

    local procedure GetDocumentHeader()
    begin
        if (LastDocumentNo = '') or (LastDocumentNo <> Rec.DocumentNo) then
            DocumentHeader.Get(DocumentNo);

        LastDocumentNo := DocumentNo;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnExtendedLineTypeValidate(var DemoDocumentLine: Record DemoDocumentLine; var IsHandled: Boolean)
    begin
    end;

}
