codeunit 60152 "Test PlayWithPet"
{
    Subtype = Test;

    var
        Assert: Codeunit Assert;
        ChosenPet: Enum PetType;

    [Test]
    [HandlerFunctions('ChoosePetHandler')]
    procedure TestPlayWithPet_OK()
    var
        PlayWithPet: Codeunit PlayWithPet;
        FakePetSpy: Codeunit FakePetSpy;
    begin
        // [ARRANGE]
        ChosenPet := PetType::Fake;

        // [ACT]
        BindSubscription(FakePetSpy);
        PlayWithPet.PlayWithPet();
        UnbindSubscription(FakePetSpy);

        // [ASSERT]
        Assert.IsTrue(FakePetSpy.IsInvoked(), 'MakeSound was not invoked');
    end;

    [Test]
    [HandlerFunctions('ChoosePetHandler')]
    procedure TestPlayWithPet_Cancel()
    var
        PlayWithPet: Codeunit PlayWithPet;
        FakePetSpy: Codeunit FakePetSpy;
    begin
        // [ARRANGE]
        Clear(ChosenPet);

        // [ACT]
        BindSubscription(FakePetSpy);
        PlayWithPet.PlayWithPet();
        UnbindSubscription(FakePetSpy);

        // [ASSERT]
        Assert.IsFalse(FakePetSpy.IsInvoked(), 'MakeSound must not have been invoked');
    end;

    [ModalPageHandler]
    procedure ChoosePetHandler(var ChoosePet: TestPage "Choose Your Pet")
    var
        UnselectedPet: Enum PetType;
    begin
        if ChosenPet = UnselectedPet then begin
            ChoosePet.Cancel.Invoke();
            exit;
        end;
        ChoosePet.Pet.Value := Format(ChosenPet);
        ChoosePet.OK.Invoke();
    end;

}
