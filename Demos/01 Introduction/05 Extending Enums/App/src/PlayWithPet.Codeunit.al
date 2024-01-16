codeunit 60100 PlayWithPet
{
    trigger OnRun()
    begin
        PlayWithPet();
    end;

    procedure PlayWithPet()
    var
        ChoosePet: Page "Choose Your Pet";
        Pet: Enum PetType;
    begin
        if ChoosePet.ChoosePet(Pet) then
            MakeSound(Pet);
    end;

    local procedure MakeSound(Pet: Interface IPet)
    begin
        Pet.MakeSound();
    end;
}
