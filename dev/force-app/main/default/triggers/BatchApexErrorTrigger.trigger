trigger BatchApexErrorTrigger on BatchApexErrorEvent ( after insert )
{
  BatchLeadConvertErrors__c[] batchLeadConvertErrors = new BatchLeadConvertErrors__c[]{};
    
        for(BatchApexErrorEvent a: Trigger.new){
            batchLeadConvertErrors.add(new BatchLeadConvertErrors__c(
                AsyncApexJobId__c=a.AsyncApexJobId,
                Records__c = a.JobScope, 
                stackTrace__c = a.StackTrace));
        }
    	
    if(batchLeadConvertErrors.size()>0){
        insert batchLeadConvertErrors;
    }
}