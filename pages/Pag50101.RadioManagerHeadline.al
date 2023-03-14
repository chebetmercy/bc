page 50101 "RC Radio Manager Headline"
{
    Caption = 'Radio Manager Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;


    layout
    {
        area(content)
        {
            group(Headline)
            {
                Caption = '';
                ShowCaption = false;
                Visible = IsGreetingsTextVisible;
                field(GreetingsText; GreetingsTextCodeunit.GetGreetingText())
                {
                    ApplicationArea = Basic, Suite;
                    // Caption = '';
                    // ShowCaption = false;
                    // Visible = IsGreetingsTextVisible;
                    Editable = false;
                }
            }
            group(Headline2)
            {
                Caption = '';
                ShowCaption = false;
                Visible = true;
                field(LoggedOnUsers; StrSubstNo(LoggedOnUsersLabel, GetNumberOfUsersLoggedIn()))
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    DrillDown = true;
                    ToolTip = 'Click to see the list of logged on users.';
                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Concurrent Session List");
                    end;
                }
                field(MySite; StrSubstNo(MySiteLabel))
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    DrillDown = true;
                    ToolTip = 'Click to visit the site.';
                    trigger OnDrillDown()
                    begin
                        // Page.Run(Page::"Concurrent Session List");
                        // OpenBrowser('https://www.bcsolutionsprovider.com');
                        Hyperlink('https://mintelsolutions.co.ke');
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        GreetingsTextCodeunit.HeadlineOnOpenPage(Page::"RC Radio Manager Headline");
        IsGreetingsTextVisible := GreetingsTextCodeunit.IsUserGreetingVisible; // checks amount of time a user has been logged on. If it is less than 10 minutes, the greeting is shown.
    end;


    local procedure GetNumberOfUsersLoggedIn(): Integer

    var
        ActiveSessions: Record "Active Session";
    begin
        ActiveSessions.Reset();
        ActiveSessions.SetRange("Client Type", ActiveSessions."Client Type"::"Web Client");
        exit(ActiveSessions.Count());
    end;

    var
        GreetingsTextCodeunit: Codeunit "RC Headlines Page Common";
        [InDataSet]
        IsGreetingsTextVisible: Boolean;


        MySiteLabel: Label '<qualifier> The site. </qualifier> <payload> Visit the site <emphasize> BC solutions Provider</emphasize></payload>';
        LoggedOnUsersLabel: Label '<qualifier> Logged on users. </qualifier> <payload> <emphasize> %1 </emphasize> users are logged on.</payload>';
}
