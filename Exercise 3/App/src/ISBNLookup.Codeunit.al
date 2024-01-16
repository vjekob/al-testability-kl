codeunit 60100 ISBNLookup
{
    procedure LookupISBN(ISBN: Code[17]): Text[100]
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        ResponseText: Text;
        Json: JsonObject;
        Token: JsonToken;
        Title: Text;
        Subtitle: Text;
        Address: Label 'https://openlibrary.org/isbn/%1.json', Locked = true;
    begin
        if Client.Get(StrSubstNo(Address, ISBN), Response) and Response.IsSuccessStatusCode and not Response.IsBlockedByEnvironment then begin
            Response.Content.ReadAs(ResponseText);
            Json.ReadFrom(ResponseText);
            if Json.Get('title', Token) then
                Title := Token.AsValue().AsText();
            if Json.Get('subtitle', Token) then
                Subtitle := Token.AsValue().AsText();

            if Subtitle <> '' then
                exit(Title + ': ' + Subtitle)
            else
                exit(Title);
        end;
    end;
}