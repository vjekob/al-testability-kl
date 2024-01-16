codeunit 60102 Cat
{
    trigger OnRun()
    begin
        Meow();
    end;

    local procedure Meow()
    begin
        Message('Meow!');
    end;
}
