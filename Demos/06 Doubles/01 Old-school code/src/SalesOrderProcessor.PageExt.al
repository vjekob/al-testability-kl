namespace Demo.Doubles;

using Microsoft.Sales.RoleCenters;

pageextension 50100 OrderProcessorRoleCenter extends "Order Processor Role Center"
{
    actions
    {
        addafter("Sales &Credit Memo")
        {
            action(Convert)
            {
                ApplicationArea = All;
                Image = Currency;
                Caption = 'Convert Currency';
                ToolTip = 'Convert an amount from one currency to another.';
                RunObject = Page ConvertCurrency;
            }
        }

        addafter("Posted Documents")
        {
            group(CurrencyExchange)
            {
                Caption = 'Currency Exchange';

                action(Permissions)
                {
                    ApplicationArea = All;
                    Image = EncryptionKeys;
                    Caption = 'Permissions';
                    RunObject = Page CurrencyExchangePermissions;
                    ToolTip = 'Manage permissions for currency exchange.';
                }

                action(Log)
                {
                    ApplicationArea = All;
                    Image = Log;
                    Caption = 'Log';
                    RunObject = Page CurrencyExchangeLog;
                    ToolTip = 'View the currency exchange log.';
                }

                action(Convert2)
                {
                    ApplicationArea = All;
                    Image = Currency;
                    Caption = 'Convert';
                    ToolTip = 'Convert an amount from one currency to another.';
                    RunObject = Page ConvertCurrency;
                }
            }
        }
    }
}
