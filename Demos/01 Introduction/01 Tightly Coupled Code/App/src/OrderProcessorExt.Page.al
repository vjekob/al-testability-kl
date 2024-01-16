pageextension 60100 "OP Ext" extends "Order Processor Role Center"
{
    actions
    {
        addlast(creation)
        {
            action(PlayWithPet)
            {
                Caption = 'Play with Pet';
                Image = GoTo;
                ApplicationArea = All;
                ToolTip = 'Play with Pet';
                RunObject = Codeunit PlayWithPet;
            }
        }
    }
}
