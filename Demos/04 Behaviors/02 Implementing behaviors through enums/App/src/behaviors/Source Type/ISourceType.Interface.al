interface ISourceType
{
    procedure Initialize(No: Code[20]);

    procedure ValidateRequirements();

    procedure AcceptsLineType(LineType: Enum LineType): Boolean;

    procedure AcceptsQuantity(LineType: Enum LineType; Quantity: Decimal): Boolean;

}
