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
        ScaleFactory: Codeunit ScaleFactory;
        Scale: Interface IScale;
    begin
        Scale := ScaleFactory.GetScale();
        TakeWeight(Scale);
    end;

    internal procedure TakeWeight(Scale: Interface IScale)
    var
        Weight: Decimal;
    begin
        Weight := Scale.TakeWeight();
        Rec.Validate("Gross Weight", Weight);
    end;
}
