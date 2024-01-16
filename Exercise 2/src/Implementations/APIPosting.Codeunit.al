namespace Demo.Exercise2;

using Microsoft.Sales.Document;
using Microsoft.Sales.Posting;

codeunit 50202 APIPosting implements IPostingRoutine
{
    procedure Confirm(): Boolean;
    begin
        exit(true);
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
    var
        MessageVerbosity: Verbosity;
        Dimensions: Dictionary of [Text, Text];
    begin
        if IsError then
            Error(MessageToShow);

        if IsError then
            MessageVerbosity := Verbosity::Error
        else
            MessageVerbosity := Verbosity::Normal;

        LogMessage('APIPOST', StrSubstNo('Posting document with message: %1', MessageToShow), MessageVerbosity, DataClassification::SystemMetadata, TelemetryScope::All, Dimensions);
    end;
}
