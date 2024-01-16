page 60100 Books
{
    Caption = 'Books';
    Editable = true;
    PageType = List;
    SourceTable = Book;

    layout
    {
        area(Content)
        {
            repeater(Books)
            {
                field(ISBN; Rec.ISBN)
                {
                    Caption = 'ISBN';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ISBN number of the book.';
                }

                field(Title; Rec.Title)
                {
                    Caption = 'Title';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the title of the book.';
                }
            }
        }
    }
}