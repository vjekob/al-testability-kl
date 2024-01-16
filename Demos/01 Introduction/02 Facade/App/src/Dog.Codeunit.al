codeunit 60101 Dog
{
    trigger OnRun()
    begin
        Woof();
    end;

    local procedure Woof()
    begin
        Message('Woof!');
    end;
}
