page 60100 "Choose Your Pet"
{
    PageType = StandardDialog;
    Caption = 'Choose your pet';

    layout
    {
        area(Content)
        {
            field(Pet; Pet)
            {
                Caption = 'Pet';
                ApplicationArea = All;
            }
        }
    }

    var
        Pet: Enum PetType;

    procedure ChoosePet(var PetType: Enum PetType): Boolean
    begin
        if CurrPage.RunModal() = Action::OK then begin
            PetType := Pet;
            exit(true);
        end;
    end;
}
