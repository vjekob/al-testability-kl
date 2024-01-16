enum 50200 PostingRoutine implements IPostingRoutine
{
    Caption = 'Posting Routine';
    Extensible = true;

    value(0; Default)
    {
        Caption = 'Default';
        Implementation = IPostingRoutine = WebClientPosting;
    }

    value(1; POS)
    {
        Caption = 'POS';
        Implementation = IPostingRoutine = POSPosting;
    }

    value(3; API)
    {
        Caption = 'API';
        Implementation = IPostingRoutine = APIPosting;
    }
}