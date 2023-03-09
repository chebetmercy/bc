page 50105 "Radio MD "
{
    Caption = 'Radio MD Role Center';
    PageType = RoleCenter;

    layout
    {
        
        area(RoleCenter)
        {
            group(group1)
            {
                Caption = 'Group 1';
                part(part1; "Acc. Receivable Activities")
                {
                    ApplicationArea = All;
                }
                part(part2; "Acc. Receivable Activities")
                {
                    ApplicationArea = All;
                }
                part(part3; "Acc. Payables Activities")
                {
                    ApplicationArea = All;
                }

            }
        }
        
    }
    actions
    {
        area(Sections)
        {
            group(General)
            {
                Caption = 'General';
                action("Skiza Radio MD")
                {
                   RunObject = Page "Receivables-Payables";
                }
                action("Permission Sets")
                {
                   RunObject = Page "Permission Sets";
                }
                
                action("Users")
                {
                    RunObject = Page "Users";
                }
            }
        }
    }

}

profile SkizaRadioMD
{
    Caption = 'Skiza Radio MD';
    RoleCenter = "Radio MD ";
    ProfileDescription = 'Skiza Radio Manager';
}
