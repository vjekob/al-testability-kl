namespace Demo.Exercise2;

using Microsoft.Sales.Document;
using Microsoft.Sales.Posting;

codeunit 50205 DefaultPost implements IPost
{
    procedure Post(var SalesHeader: Record "Sales Header"): Boolean;
    var
        SalesPost: Codeunit "Sales-Post";
    begin
        exit(SalesPost.Run(SalesHeader));
    end;

    procedure GetErrorMessage(): Text;
    begin
        exit(GetLastErrorText());
    end;
}
