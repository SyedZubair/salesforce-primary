trigger LeadTrigger on Lead (before insert, before update, before delete, 
                             after insert, after update, after delete, after undelete) {
                                 
                                 
                                 if(Trigger.isBefore){
                                	
                                     if(Trigger.isInsert){
                                         
                                     } 
                                     if(Trigger.isUpdate){
                                         LeadTriggerHelper.restricFieldValueChange(Trigger.oldMap, Trigger.newMap);
                                         
                                     }
                                     if(Trigger.isDelete){
                                         
                                     }
                                     
                                 }
                                 if(Trigger.isAfter){
                                     if(Trigger.isInsert){
                                         
                                     }
                                     if(Trigger.isUpdate){
                                         
                                     }
                                     if(Trigger.isDelete){
                                         
                                     }
                                     if(Trigger.isUnDelete){
                                         
                                     }
                                 }
                                 
                                
                             }