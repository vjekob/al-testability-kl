codeunit 60100 PlayWithPet
{
    procedure PlayWithPet()
    var
        PetCodeunit: Integer;
    begin
        PetCodeunit := ChoosePet();
        if PetCodeunit > 0 then
            MakeSound(PetCodeunit);
    end;

    local procedure ChoosePet() PetCodeunit: Integer;
    var
        Pet: Option Unknown,Dog,Cat,Duck;
    begin
        Pet := StrMenu('Dog,Cat,Duck', 0, 'Pick your pet:');

        case Pet of
            Pet::Dog:
                PetCodeunit := Codeunit::Dog;
            Pet::Cat:
                PetCodeunit := Codeunit::Cat;
            Pet::Duck:
                PetCodeunit := Codeunit::Duck;
        end;
    end;

    local procedure MakeSound(PetCodeunit: Integer)
    begin
        Codeunit.Run(PetCodeunit);
    end;
}
