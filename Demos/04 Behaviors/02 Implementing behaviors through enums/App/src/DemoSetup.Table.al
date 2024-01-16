table 50101 DemoSetup
{
    Caption = 'Demo Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'Primary Key';
            Editable = false;
        }

        field(2; MaximumBalance; Decimal)
        {
            Caption = 'Maximum Balance';
        }

    }

    keys
    {
        key(PrimaryKey; PrimaryKey) { }
    }

    procedure GetSetup()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;

    procedure MaximumBalanceExceeded(Balance: Decimal): Boolean
    begin
        Rec.GetSetup();
        if Balance > Rec.MaximumBalance then
            exit(true);

        // Do other checks if necessary

        exit(false);
    end;

}
