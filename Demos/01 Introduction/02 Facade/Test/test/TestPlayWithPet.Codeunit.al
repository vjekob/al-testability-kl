codeunit 60152 "Test PlayWithPet"
{
    Subtype = Test;

    var
        Assert: Codeunit Assert;
        StrMenuReply: Option Undefined,Dog,Cat,Duck;
        MessageShown: Text;

    [Test]
    [HandlerFunctions('StrMenuHandler,MessageHandler')]
    procedure TestDog()
    var
        PlayWithPet: Codeunit PlayWithPet;
    begin
        // [ARRANGE]
        StrMenuReply := StrMenuReply::Dog;
        Clear(MessageShown);

        // [ACT]
        PlayWithPet.PlayWithPet();

        // [ASSERT]
        Assert.AreEqual('Woof!', MessageShown, 'Invalid message shown');
    end;

    [Test]
    [HandlerFunctions('StrMenuHandler,MessageHandler')]
    procedure TestCat()
    var
        PlayWithPet: Codeunit PlayWithPet;
    begin
        // [ARRANGE]
        StrMenuReply := StrMenuReply::Cat;
        Clear(MessageShown);

        // [ACT]
        PlayWithPet.PlayWithPet();

        // [ASSERT]
        Assert.AreEqual('Meow!', MessageShown, 'Invalid message shown');
    end;

    [Test]
    [HandlerFunctions('StrMenuHandler,MessageHandler')]
    procedure TestDuck()
    var
        PlayWithPet: Codeunit PlayWithPet;
    begin
        // [ARRANGE]
        StrMenuReply := StrMenuReply::Duck;
        Clear(MessageShown);

        // [ACT]
        PlayWithPet.PlayWithPet();

        // [ASSERT]
        Assert.AreEqual('Quack!', MessageShown, 'Invalid message shown');
    end;

    [Test]
    [HandlerFunctions('StrMenuHandler')]
    procedure TestCancel()
    var
        PlayWithPet: Codeunit PlayWithPet;
    begin
        // [ARRANGE]
        StrMenuReply := StrMenuReply::Undefined;
        Clear(MessageShown);

        // [ACT]
        PlayWithPet.PlayWithPet();

        // [ASSERT]
        Assert.AreEqual('', MessageShown, 'Message must not have been shown');
    end;

    [StrMenuHandler]
    procedure StrMenuHandler(Options: Text[1024]; var Choice: Integer; Instruction: Text[1024])
    begin
        choice := StrMenuReply;
    end;

    [MessageHandler]
    procedure MessageHandler(MsgText: Text[1024])
    begin
        MessageShown := MsgText;
    end;
}

