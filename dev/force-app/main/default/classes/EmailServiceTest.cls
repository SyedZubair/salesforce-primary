@isTest(seealldata=true)
public class EmailServiceTest {
    
    
    @isTest
    static void testInbound(){
        // create a new email and envelope object
        Messaging.InboundEmail email = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
        String[] emailAddress = new List<String>{'test@test.com'};
        //Please query case custom object record and update accordingly
        email.subject = 'Testing(a1d6F00000A7eidQAB)';
        email.toAddresses = emailAddress;
        env.fromAddress = 'test@test.com';
        
        // call the email service class and test it with the data in the testMethod
        EmailServiceInbound emailProcess = new EmailServiceInbound();
        emailProcess.handleInboundEmail(email, env);
    }    
    
    @isTest
    static void testOutbound(){
        //Please query case custom object record and update accordingly
        EmailServiceOutbound.sendMailMethod('test@test.com', 'Testing(a1d6F00000A7eidQAB)', 'Test', 'a1d6F00000A7eidQAB');
        
    }   
}