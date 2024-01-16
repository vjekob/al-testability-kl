namespace Demo.Exercise2;

using Microsoft.Sales.Document;

interface IPostingRoutine
{
    procedure Confirm(): Boolean;
    procedure Post(var SalesHeader: Record "Sales Header"): Boolean;
    procedure GetErrorMessage(): Text;
    procedure Notify(MessageToShow: Text; IsError: Boolean);
}
