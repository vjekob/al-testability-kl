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
                ISourceType: Interface ISourceType;
            begin
                if Rec.SourceNo = '' then
                    exit;

                ISourceType := Rec.SourceType;
                ISourceType.Initialize(No);
                ISourceType.ValidateRequirements();
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

    local procedure ValidateExtendedSourceType()
    var
        UnknownSourceTypeErr: Label 'Unknown source type: %1.';
        IsHandled: Boolean;
    begin
        OnExtendedSourceTypeValidate(Rec, IsHandled);
        if not IsHandled then
            Error(UnknownSourceTypeErr, SourceType);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnExtendedSourceTypeValidate(var DemoDocumentHeader: Record DemoDocumentHeader; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnExtendedLineTypeValidate(var DemoJournalLine: Record DemoJournalLine; var IsHandled: Boolean)
    begin
    end;

}
