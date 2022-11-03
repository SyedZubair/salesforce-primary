trigger ClosedOpportunityTrigger on Opportunity (before insert,before update) 
{
    list<Task> lstNewTaskToInsert = new list<Task>();
    for(Opportunity opty: Trigger.new)
    {
        if(opty.StageName.equals('Closed Won'))
        {
            lstNewTaskToInsert.add(new Task(Subject='Follow Up Test Task',
            
                                    WhatId=opty.Id));
        }
    }    
    
    //insert opportuniy
    if(!lstNewTaskToInsert.isEmpty())
    {
        Database.insert(lstNewTaskToInsert);
    }
}