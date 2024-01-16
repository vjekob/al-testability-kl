namespace Demo.Exercise2;

codeunit 50203 UIConfirm implements IConfirm
{
    procedure Confirm(): Boolean;
    begin
        exit(Dialog.Confirm('Do you want to post the document?'));
    end;
}
