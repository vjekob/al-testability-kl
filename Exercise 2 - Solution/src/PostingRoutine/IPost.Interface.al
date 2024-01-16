namespace Demo.Exercise2;

using Microsoft.Sales.Document;

interface IPost
{
    procedure Post(var SalesHeader: Record "Sales Header"): Boolean;
    procedure GetErrorMessage(): Text;
}
