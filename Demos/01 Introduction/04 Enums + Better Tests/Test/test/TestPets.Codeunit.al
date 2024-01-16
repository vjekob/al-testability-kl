codeunit 60154 "Test Pets"
{
    Subtype = Test;

    var
        Assert: Codeunit Assert;
        MessageShown: Text;

    [Test]
    [HandlerFunctions('MessageHandler')]
    procedure TestDog()
    var
        Dog: Codeunit Dog;
    begin
        // [ARRANGE]
        Clear(MessageShown);

        // [ACT]
        Dog.MakeSound();

        // [ASSERT]
        Assert.AreEqual('Woof!', MessageShown, 'Invalid message shown');
    end;

    [Test]
    [HandlerFunctions('MessageHandler')]
    procedure TestCat()
    var
        Cat: Codeunit Cat;
    begin
        // [ARRANGE]
        Clear(MessageShown);

        // [ACT]
        Cat.MakeSound();

        // [ASSERT]
        Assert.AreEqual('Meow!', MessageShown, 'Invalid message shown');
    end;

    [Test]
    [HandlerFunctions('MessageHandler')]
    procedure TestDuck()
    var
        Duck: Codeunit Duck;
    begin
        // [ARRANGE]
        Clear(MessageShown);

        // [ACT]
        Duck.MakeSound();

        // [ASSERT]
        Assert.AreEqual('Quack!', MessageShown, 'Invalid message shown');
    end;

    [MessageHandler]
    procedure MessageHandler(MsgText: Text[1024])
    begin
        MessageShown := MsgText;
    end;
}
