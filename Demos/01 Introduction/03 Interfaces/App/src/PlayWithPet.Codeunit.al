codeunit 60100 PlayWithPet
{
    procedure PlayWithPet()
    var
        Pet: Interface IPet;
    begin
        if ChoosePet(Pet) then
            MakeSound(Pet);
    end;

    local procedure ChoosePet(var Pet: Interface IPet): Boolean;
    var
        Dog: Codeunit Dog;
        Cat: Codeunit Cat;
        Duck: Codeunit Duck;
        PetOption: Option Unknown,Dog,Cat,Duck;
    begin
        PetOption := StrMenu('Dog,Cat,Duck', 0, 'Pick your pet:');

        case PetOption of
            PetOption::Dog:
                Pet := Dog;
            PetOption::Cat:
                Pet := Cat;
            PetOption::Duck:
                Pet := Duck;
            else
                exit(false);
        end;

        exit(true);
    end;

    local procedure MakeSound(Pet: Interface IPet)
    begin
        Pet.MakeSound();
    end;
}
