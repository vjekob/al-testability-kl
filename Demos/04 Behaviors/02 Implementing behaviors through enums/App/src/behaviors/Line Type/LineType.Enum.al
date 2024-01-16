enum 50100 LineType implements ILineType
{
    Caption = 'Line Type';

    value(1; Item)
    {
        Caption = 'Item';
        Implementation = ILineType = LineTypeItem;
    }

    value(2; Resource)
    {
        Caption = 'Resource';
        Implementation = ILineType = LineTypeResource;
    }

    value(3; GLAccount)
    {
        Caption = 'G/L Account';
        Implementation = ILineType = LineTypeGLAccount;
    }

}
