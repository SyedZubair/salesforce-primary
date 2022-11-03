trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    //Trigger, Handler, Batch > 95% (75%)
    
    system.debug('inside trigger');
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            AccountTriggerHandler.validateAccountActive(trigger.OldMap, trigger.NewMap);
            //FutureHandler.processContactCreation();
        }
    }
    
    if(Trigger.isBefore){
        
        if(Trigger.isInsert){
            AccountTriggerHandler.captureBillingPostalCode(Trigger.new);  
        }
        
        if(Trigger.isUpdate){            
            AccountTriggerHandler.captureBillingPostalCode(Trigger.new);            
        }
    }
    
    
    
}