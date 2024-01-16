enum 50101 SourceType implements ISourceType
{
    Caption = 'Source Type';
    Extensible = true;

    value(1; Customer)
    {
        Caption = 'Customer';
        Implementation = ISourceType = SourceTypeCustomer;
    }

    value(2; Vendor)
    {
        Caption = 'Vendor';
        Implementation = ISourceType = SourceTypeVendor;
    }

    value(3; Location)
    {
        Caption = 'Location';
        Implementation = ISourceType = SourceTypeLocation;
    }

}
