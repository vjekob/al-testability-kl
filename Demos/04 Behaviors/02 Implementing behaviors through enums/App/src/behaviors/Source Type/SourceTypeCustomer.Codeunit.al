codeunit 50100 SourceTypeCustomer implements ISourceType
{
    var
        _customer: Record Customer;

    procedure Initialize(No: Code[20]);
    begin
        _customer.Get(No);
    end;

    internal procedure Initialize(Customer: Record Customer)
    begin
        _customer := Customer;
    end;

    procedure ValidateRequirements();
    begin
        _customer.TestField(Blocked, "Customer Blocked"::" ");
        _customer.TestField("Customer Posting Group");
        _customer.TestField("Gen. Bus. Posting Group");
        _customer.TestField("VAT Registration No.");

        ValidateMaximumBalance();
    end;

    local procedure ValidateMaximumBalance()
    var
        Setup: Record DemoSetup;
        MaximumBalanceExceededErr: Label 'Customer %1 exceeded the maximum allowed balance for demo journal.';
    begin
        _customer.CalcFields("Balance Due");
        if Setup.MaximumBalanceExceeded(_customer."Balance Due") then
            Error(MaximumBalanceExceededErr, _customer."No.");
    end;

    procedure AcceptsLineType(LineType: Enum LineType): Boolean;
    var
        Accepts: Boolean;
        IsHandled: Boolean;
    begin
        if LineType in [LineType::GLAccount, LineType::Resource] then
            exit(true);

        OnAcceptsLineType(LineType, Accepts, IsHandled);
        if IsHandled then
            exit(Accepts);

        exit(false);
    end;

    procedure AcceptsQuantity(LineType: enum LineType; Quantity: Decimal): Boolean;
    begin
        exit(Quantity >= 0);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAcceptsLineType(LineType: Enum LineType; var Accepts: Boolean; var IsHandled: Boolean)
    begin
    end;

}
