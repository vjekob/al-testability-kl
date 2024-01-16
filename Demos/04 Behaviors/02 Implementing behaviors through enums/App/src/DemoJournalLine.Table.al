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
                ISourceType: Interface ISourceType;
            begin
                if Rec.SourceNo = '' then
                    exit;

                ISourceType := Rec.SourceType;
                ISourceType.Initialize(No);
                ISourceType.ValidateRequirements();
            end;
        }

        field(4; LineType; Enum LineType)
        {
            Caption = 'Line Type';

            trigger OnValidate()
            var
                ISourceType: Interface ISourceType;
            begin
                ISourceType := Rec.SourceType;
                if not ISourceType.AcceptsLineType(Rec.LineType) then
                    Rec.FieldError(SourceType);
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
                ILineType: Interface ILineType;
            begin
                if Rec.No = '' then
                    exit;

                ILineType := Rec.LineType;
                ILineType.Initialize(Rec.No);
                ILineType.ValidateRequirements();
            end;
        }

        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';


            trigger OnValidate()
            var
                ISourceType: Interface ISourceType;
                MustNotBeNegativeErr: Label 'must not be negative';
            begin
                ISourceType := Rec.SourceType;
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

}
