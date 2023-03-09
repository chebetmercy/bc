page 50100 "Radio MD "
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

}

profile SkizaRadioMD
{
    Caption = 'Skiza Radio MD';
    RoleCenter = "Radio MD ";
    ProfileDescription = 'Skiza Radio Manager';
}
