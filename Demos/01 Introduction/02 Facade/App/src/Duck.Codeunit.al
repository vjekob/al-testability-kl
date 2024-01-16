codeunit 60103 Duck
{
    trigger OnRun()
    begin
        Quack();
    end;

    local procedure Quack()
    begin
        Message('Quack!');
    end;
}
