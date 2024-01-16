namespace Demo.Exercise1;
using Microsoft.Finance.Currency;
using Microsoft.Sales.Document;

page 50102 ConvertCurrency
{
    Caption = 'Convert Currency';
    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            field(CurrencyFrom; CurrencyFrom)
            {
                Caption = 'From Currency Code';
                ApplicationArea = All;
                ToolTip = 'Specifies currency from which to translate an amount';
                TableRelation = Currency;
            }

            field(CurrencyTo; CurrencyTo)
            {
                Caption = 'To Currency Code';
                ApplicationArea = All;
                ToolTip = 'Specifies currency to which to translate an amount';
                TableRelation = Currency;
            }

            field(AmountFrom; AmountFrom)
            {
                Caption = 'From Amount';
                ApplicationArea = All;
                ToolTip = 'Specifies amount to translate';

                trigger OnValidate()
                begin
                    Convert();
                end;
            }

            field(AmountTo; AmountTo)
            {
                Caption = 'To Amount';
                ApplicationArea = All;
                ToolTip = 'Specifies translated amount';
                Editable = false;
            }
        }
    }

    var
        CurrencyFrom: Code[10];
        CurrencyTo: Code[10];
        AmountFrom: Decimal;
        AmountTo: Decimal;

    local procedure Convert()
    var
        ConvertCurrency: Codeunit ConvertCurrency;
        Salesorder: Page "Sales Order";
    begin
        AmountTo := ConvertCurrency.Convert(AmountFrom, CurrencyFrom, CurrencyTo);
    end;
}