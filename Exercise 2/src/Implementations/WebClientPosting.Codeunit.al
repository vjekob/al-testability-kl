namespace Demo.Exercise2;

using Microsoft.Sales.Document;
using Microsoft.Sales.Posting;

codeunit 50200 WebClientPosting implements IPostingRoutine
{
    procedure Confirm(): Boolean;
    begin
        exit(Dialog.Confirm('Do you want to post the document?'));
    end;

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

    procedure Notify(MessageToShow: Text; IsError: Boolean);
    begin
        if IsError then
            Error(MessageToShow)
        else
            Message(MessageToShow);
    end;
}
