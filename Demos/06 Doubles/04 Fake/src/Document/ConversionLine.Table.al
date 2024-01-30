table 50103 ConversionLine
{
    Caption = 'Conversion Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; DocumentNo; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }

        field(2; LineNo; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }

        field(3; FromCurrencyCode; Code[10])
        {
            Caption = 'From Currency Code';
            DataClassification = CustomerContent;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                ConvertAmount();
            end;
        }

        field(4; ToCurrencyCode; Code[10])
        {
            Caption = 'To Currency Code';
            DataClassification = CustomerContent;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                ConvertAmount();
            end;
        }

        field(5; FromAmount; Decimal)
        {
            Caption = 'From Amount';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ConvertAmount();
            end;
        }

        field(6; ToAmount; Decimal)
        {
            Caption = 'To Amount';
            DataClassification = CustomerContent;
            Editable = false;

            trigger OnValidate()
            begin
                ConvertAmount();
            end;
        }
    }

    keys
    {
        key(PrimaryKey; DocumentNo, LineNo)
        {
            Clustered = true;
        }
    }

    var
        Convert: Codeunit ConvertCurrency02;
        GlobalFactory: Codeunit GlobalFactory;

    local procedure ConvertAmount()
    begin
        Rec.ToAmount := Convert.Convert(Rec.FromAmount, Rec.FromCurrencyCode, Rec.ToCurrencyCode, GlobalFactory.GetFactory());
    end;

}
