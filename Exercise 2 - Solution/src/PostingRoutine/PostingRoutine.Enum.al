namespace Demo.Exercise2;

enum 50200 PostingRoutine implements IConfirm, IPost, INotify
{
    Caption = 'Posting Routine';
    Extensible = true;

    DefaultImplementation =
        IPost = DefaultPost;

    value(0; Default)
    {
        Caption = 'Default';
        Implementation =
            IConfirm = UIConfirm,
            INotify = UINotify;
    }

    value(1; POS)
    {
        Caption = 'POS';
        Implementation =
            IConfirm = AlwaysConfirm,
            INotify = UINotify;
    }

    value(3; API)
    {
        Caption = 'API';
        Implementation =
            IConfirm = AlwaysConfirm,
            INotify = TelemetryNotify;
    }
}
