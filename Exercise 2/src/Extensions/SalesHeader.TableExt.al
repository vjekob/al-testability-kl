namespace Demo.Exercise2;

using Microsoft.Sales.Document;
using Microsoft.Sales.Setup;

tableextension 50201 SalesHeader extends "Sales Header"
{
    procedure PostWithRoutine()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        PostingRoutine: Interface IPostingRoutine;
        PostingMessage: Text;
        SuccessLbl: Label 'Successfully posted.';
        FailureLbl: Label 'Failed to post: %1', Comment = '%1 is the error message';
    begin
        SalesSetup.Get();
        PostingRoutine := SalesSetup.PostingRoutine;
        if not PostingRoutine.Confirm() then
            exit;

        PostingMessage := SuccessLbl;
        if not PostingRoutine.Post(Rec) then
            PostingMessage := StrSubstNo(FailureLbl, PostingRoutine.GetErrorMessage());

        PostingRoutine.Notify(PostingMessage, false);
    end;
}
