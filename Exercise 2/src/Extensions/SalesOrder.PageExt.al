namespace Demo.Exercise2;

using Microsoft.Sales.Document;

pageextension 50200 SalesOrder extends "Sales Order"
{
    actions
    {
        addfirst(processing)
        {
            action(PostWithRoutine)
            {
                Caption = 'Post (Demo)';
                Image = Post;
                ApplicationArea = All;
                ToolTip = 'Post the sales order using the demo posting routine';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.PostWithRoutine();
                end;
            }
        }
    }
}
