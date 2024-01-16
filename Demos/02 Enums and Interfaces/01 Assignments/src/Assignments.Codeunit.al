codeunit 60100 Assignments
{
    var
        Volvo: Codeunit Volvo;
        Mercedes: Codeunit Mercedes;
        Tesla: Codeunit Tesla;
        Poodle: Codeunit Poodle;
        Husky: Codeunit Husky;
        Mastiff: Codeunit Mastiff;

    procedure InterfaceFromMatchingCodeunit()
    var
        CarIntf: Interface ICar;
        DogIntf: Interface IDog;
    begin
        // Valid assignments
        CarIntf := Volvo;
        CarIntf := Mercedes;
        CarIntf := Tesla;
        DogIntf := Poodle;
        DogIntf := Husky;
        DogIntf := Mastiff;

        // Invalid assignments
        CarIntf := Poodle;
        DogIntf := Volvo;
    end;

    procedure InterfaceFromMatchingEnum()
    var
        CarIntf: Interface ICar;
        DogIntf: Interface IDog;
    begin
        // Valid assignments
        CarIntf := Car::Volvo;
        CarIntf := Car::Mercedes;
        CarIntf := Car::Tesla;
        DogIntf := Dog::Poodle;
        DogIntf := Dog::Husky;
        DogIntf := Dog::Mastiff;
        CarIntf := Transformer::Poolvo;
        CarIntf := Transformer::Huskedes;
        CarIntf := Transformer::Masla;
        DogIntf := Transformer::Poolvo;
        DogIntf := Transformer::Huskedes;
        DogIntf := Transformer::Masla;

        // Invalid assignments
        CarIntf := Dog::Poodle;
        DogIntf := Car::Volvo;
    end;

    procedure InterfaceFromSameInterface()
    var
        CarIntf1, CarIntf2 : Interface ICar;
        DogIntf1, DogIntf2 : Interface IDog;
    begin
        // Valid assignments
        CarIntf1 := CarIntf2;
        CarIntf2 := CarIntf1;
        DogIntf1 := DogIntf2;
        DogIntf2 := DogIntf1;

        // Invalid assignments
        CarIntf1 := DogIntf2;
        DogIntf1 := CarIntf2;
    end;

    procedure EnumFromInterface()
    var
        DogIntf: Interface IDog;
        CarIntf: Interface ICar;
        DogType: Enum Dog;
        CarType: Enum Car;
        TransformerType: Enum Transformer;
    begin
        // Invalid assignments
        DogType := DogIntf;
        CarType := CarIntf;
        TransformerType := DogIntf;
        TransformerType := CarIntf;
    end;

    procedure EnumFromCodeunit()
    var
        DogType: Enum Dog;
        CarType: Enum Car;
    begin
        // Invalid assignments
        DogType := Mastiff;
        CarType := Tesla;
    end;
}
