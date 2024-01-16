namespace Demo.Exercise2;

codeunit 50204 AlwaysConfirm implements IConfirm
{
    procedure Confirm(): Boolean;
    begin
        exit(true);
    end;
}
