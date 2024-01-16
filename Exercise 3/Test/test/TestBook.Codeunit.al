codeunit 60152 "Test Book"
{
    Subtype = Test;

    var
        Assert: Codeunit Assert;

    [Test]
    procedure Test_ISBN_Lookup_OK()
    var
        Book: Record Book;
    begin
        // Arrange

        // Act
        Book.Validate(ISBN, '978-0-13-235088-4');

        // Assert
        Assert.IsTrue(Book.Title <> '', 'Title is empty');
    end;


    [Test]
    procedure Test_ISBN_Lookup_NotOK()
    var
        Book: Record Book;
    begin
        // Arrange

        // Act
        Book.Validate(ISBN, '488-1-A3-235088-4');

        // Assert
        Assert.IsTrue(Book.Title = '', 'Title is not empty');
    end;
}
