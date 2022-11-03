/** Class Name   : EmailServiceInbound 
*  Description  : For all incoming email messages , this class invoke.
*  Created By   : Naveen Dhanaraj
*
*  Modification Log:  
*  --------------------------------------------------------------------------------------------------------------------------------------
*   Developer                Date                   Modification ID      Description 
*  ---------------------------------------------------------------------------------------------------------------------------------------
**/
global class EmailServiceInbound implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        String myPlainText= '';
        // Add the email plain text into the local variable 
        myPlainText = email.plainTextBody;        
        system.debug('####unique message ID##'+email.messageId);
        
        // For storing Relation Id
        string oppcid ='';
        
        string sss= email.subject;
        System.debug('sss '+ sss);
        string [] a = sss.split('\\(');
        system.debug('a0 ='+ a[0]);
        //system.debug('a1 ='+ a[1]);
        string [] bb = a[1].split('\\)');
        system.debug('bb>>>Final ID>>>> '+bb[0] );
        string subrecid = bb[0] ;       
        

        If (subrecid.startsWith('a1d')){
            //Add Inbound Email Message for contact
            EmailMessage conEmailMessage = new EmailMessage();
            conEmailMessage.ToAddress =  String.join(email.toAddresses, ',');
            conEmailMessage.FromAddress = email.FromAddress;
            conEmailMessage.FromName = email.FromName;
            conEmailMessage.Subject = email.subject;
            conEmailMessage.status = '2';
            conEmailMessage.HtmlBody = email.htmlBody;
            System.debug('htmlBody:>>>> ' + email.htmlBody );
            conEmailMessage.Incoming= True;
            conEmailMessage.TextBody = email.plainTextBody;
            System.debug('TextBody:>>>>> ' + email.plainTextBody);
            conEmailMessage.Case_ACE__c =subrecid;
            insert conEmailMessage;
            System.debug('Reply Email: ' + conEmailMessage ); 
            
            // Add Email Message Relation for id of the sender
            EmailMessageRelation emr = new EmailMessageRelation();
            emr.EmailMessageId = conEmailMessage.id;
            //emr.RelationId = subrecid;// user id of the sender
            emr.RelationAddress = email.FromAddress;
            emr.RelationType = 'FromAddress';
            insert emr; 
            system.debug('>>>>>=='+ emr );
        }
		        
        return result;
    }
}