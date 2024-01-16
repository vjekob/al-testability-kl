namespace Demo.Exercise2;

codeunit 50206 UINotify implements INotify
{
    procedure Notify(MessageToShow: Text; IsError: Boolean);
    begin
        if IsError then
            Error(MessageToShow)
        else
            Message(MessageToShow);
    end;
}
