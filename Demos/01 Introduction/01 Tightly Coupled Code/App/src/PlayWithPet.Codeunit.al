codeunit 60100 PlayWithPet
{
    procedure PlayWithPet()
    var
        Pet: Integer;
    begin
        Pet := ChoosePet();
        if Pet > 0 then
            MakeSound(Pet);
    end;

    local procedure ChoosePet() Pet: Integer;
    begin
        Pet := StrMenu('Dog,Cat,Duck', 0, 'Pick your pet:');
    end;

    local procedure MakeSound(Pet: Option Unknown,Dog,Cat,Duck)
    begin
        case Pet of
            Pet::Dog:
                Message('Woof!');
            Pet::Cat:
                Message('Meow!');
            Pet::Duck:
                Message('Quack!');
        end;
    end;
}
