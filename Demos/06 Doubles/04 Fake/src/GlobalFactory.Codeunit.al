namespace Demo.Doubles;

/*
    This global factory object serves the purpose of allowing code to share the same instance
    of a factory. This is useful for those scenarios where we want to allow some "global"
    dependencies that can be handled with fake test doubles, while still allowing full flexibility
    of individual functionality to depend on specific instances of factories preconfigured with
    specific dependency setups.

    REMEMBER: YOU DO NOT HAVE TO USE THIS APPROACH!

    If you don't have the need for this (the need explained in the first paragraph) and you
    want to have global factories, it's enough to simply make factory codeunit itself a single-
    instance one, and remove the factory parameter from all individual methods.

    The reason why this codeunit is here is not to tell you that this is the only way to have it,
    but to show you different levels of flexibility that is possible to achieve if you need it.

    HOW YOU IMPLEMENT YOUR FACTORIES IS ENTIRELY YOUR CHOICE AND DEPENDS ENTIRELY ON YOUR REQUIREMENTS.
*/

codeunit 50107 GlobalFactory
{
    SingleInstance = true;

    var
        _factory: Codeunit Factory;

    procedure SetFactory(Factory: Codeunit Factory)
    begin
        _factory := Factory;
    end;

    procedure GetFactory(): Codeunit Factory
    begin
        exit(_factory);
    end;
}
