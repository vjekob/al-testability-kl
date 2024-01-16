namespace Demo.Scales;

using Microsoft.Sales.Document;

tableextension 50100 SalesLineExt extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            trigger OnAfterValidate();
            begin
                if Rec.Type <> "Sales Line Type"::Item then
                    exit;

                Rec.TakeWeight();
            end;
        }
    }

    internal procedure TakeWeight()
    var
        Scale: Interface IScale;
        Weight: Decimal;
    begin
        Weight := Scale.TakeWeight(); // This is now broken 🤔
        Rec.Validate("Gross Weight", Weight);
    end;
}
