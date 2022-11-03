public class AttachmentController {
	@AuraEnabled
    public static void updatePicturePath(String recId){
        //In Lightning Experience, Attachments are stored in ContentDocuments
        List<ContentDocumentLink> docLink = [ SELECT ContentDocumentId
                               FROM ContentDocumentLink
                               WHERE LinkedEntityId = :recId order by Id desc Limit 1];
        //ContentVersion Id uniquely identifies the attachment
        List<ContentVersion> ver;
        
        if(!docLink.isEmpty()){
         ver = [SELECT Id FROM ContentVersion Where ContentDocumentId = :docLink[0].ContentDocumentId];    
        }
		
        //Update the Picture_Path field with the url of the image
        Speaker__c speaker = [SELECT Id FROM Speaker__c WHERE Id = :recId];
        speaker.Picture_Path__c = '/sfc/servlet.shepherd/version/download/'+ ver[0].Id;
        upsert speaker;
    }

}