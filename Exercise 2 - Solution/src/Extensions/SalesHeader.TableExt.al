namespace Demo.Exercise2;

using Microsoft.Sales.Document;
using Microsoft.Sales.Setup;

tableextension 50201 SalesHeader extends "Sales Header"
{
    procedure PostWithRoutine()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        Confirmation: Interface IConfirm;
        Posting: Interface IPost;
        Notification: Interface INotify;
        PostingMessage: Text;
        SuccessLbl: Label 'Successfully posted.';
        FailureLbl: Label 'Failed to post: %1', Comment = '%1 is the error message';
    begin
        SalesSetup.Get();
        Confirmation := SalesSetup.PostingRoutine;
        Posting := SalesSetup.PostingRoutine;
        Notification := SalesSetup.PostingRoutine;

        if not Confirmation.Confirm() then
            exit;

        PostingMessage := SuccessLbl;
        if not Posting.Post(Rec) then
            PostingMessage := StrSubstNo(FailureLbl, Posting.GetErrorMessage());

        Notification.Notify(PostingMessage, false);
    end;
}
