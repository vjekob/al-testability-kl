enum 60100 PetType implements IPet
{
    Caption = 'Pet Type';
    Extensible = true;

    value(1; Dog)
    {
        Caption = 'Dog';
        Implementation = IPet = Dog;
    }

    value(2; Cat)
    {
        Caption = 'Cat';
        Implementation = IPet = Cat;
    }

    value(3; Duck)
    {
        Caption = 'Duck';
        Implementation = IPet = Duck;
    }
}
