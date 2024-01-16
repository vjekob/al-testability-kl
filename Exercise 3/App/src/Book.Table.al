table 60100 Book
{
    Caption = 'Book';
    DataClassification = CustomerContent;

    fields
    {
        field(1; ISBN; Code[17])
        {
            Caption = 'ISBN';

            trigger OnValidate()
            var
                ISBNLookup: Codeunit ISBNLookup;
                BookTitle: Text;
            begin
                BookTitle := ISBNLookup.LookupISBN(Rec.ISBN);
                if BookTitle <> '' then
                    Rec.Title := BookTitle;
            end;
        }

        field(2; Title; Text[100])
        {
            Caption = 'Title';
        }
    }

    keys
    {
        key(PK; ISBN)
        {
            Clustered = true;
        }
    }
}
