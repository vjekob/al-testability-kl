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
            var
                ISourceType: Interface ISourceType;
            begin
                GetDocumentHeader();

                ISourceType := DocumentHeader.SourceType;
                if not ISourceType.AcceptsLineType(Rec.LineType) then
                    Rec.FieldError(Rec.LineType);
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
                ILineType: Interface ILineType;
            begin
                if Rec.No = '' then
                    exit;

                ILineType := Rec.LineType;
                ILineType.Initialize(Rec.No);
                ILineType.ValidateRequirements();
            end;
        }

        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';

            trigger OnValidate()
            var
                ISourceType: Interface ISourceType;
                MustNotBeNegativeErr: Label 'must not be negative';
            begin
                GetDocumentHeader();
                ISourceType := DocumentHeader.SourceType;
                if not ISourceType.AcceptsQuantity(Rec.LineType, Rec.Quantity) then
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

}
