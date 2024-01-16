namespace Demo.Exercise2;

codeunit 50207 TelemetryNotify implements INotify
{
    procedure Notify(MessageToShow: Text; IsError: Boolean);
    var
        MessageVerbosity: Verbosity;
        Dimensions: Dictionary of [Text, Text];
    begin
        if IsError then
            MessageVerbosity := Verbosity::Error
        else
            MessageVerbosity := Verbosity::Normal;

        LogMessage('APIPOST', StrSubstNo('Posting document with message: %1', MessageToShow), MessageVerbosity, DataClassification::SystemMetadata, TelemetryScope::All, Dimensions);

        if IsError then
            Error(MessageToShow);
    end;
}
