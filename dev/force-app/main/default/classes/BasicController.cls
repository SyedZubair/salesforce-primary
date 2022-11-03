//Access Specifier
//	Public, Global & Private
//		Class Keyword	Class Name
public class BasicController {
    
    //variable
    private String productName;
    public String productDesc;
    //Data types
    //Integer, String, Boolean, Long, Double, Date, DateTime, Time, Id (Record Id)
    //sObject (Parent) Std Account, Lead,etc.,, Custom __c, System (User)
    //sObject obj = new Account 
    //
    //Collection
    //List = Allows duplicates
    //Set = Allows unique values
    //Map = Combination of List and Set
    //Key Value Pair
    //
    //Bangalore => Karnataka
    //Mumbai => Maha
    //Punjab => Chandigarh 
    //Haryana => Chandigarh
    //
    
    
    public void collectionLead(){
        List<Lead> leadList = [SELECT Id, Name, Rating, Status, Industry FROM Lead];
        system.debug('Lead List: '+leadList);
        
        for(Lead ld: leadList){
            system.debug('lead Name: '+ld.Name);
            system.debug('lead Rating: '+ld.Rating);
        }
        
    }
    
    public void collectionExample(){
        List<String> strCollection = new List<String>{'Red', 'XXX', 'YYY','Green','Red'};
            if(strCollection.size() > 0){
                System.debug('Collection Values: '+strCollection);
                System.debug('Collection Size: '+strCollection.size()); //What is the size of a collection, //checking the size
                System.debug('Collection isEmpty?: '+strCollection.isEmpty()); //Collection is empty or not, TRUE, False
                //strCollection.clone(); //clone a collection to another
                strCollection.add('ele'); //
                System.debug('After element added: '+strCollection);
                strCollection.remove(2);
                System.debug('After element removed from index 2: '+strCollection);
                strCollection.clear();
                System.debug('Collection Values after clear: '+strCollection);
                System.debug('Collection isEmpty?: '+strCollection.isEmpty()); 
            }
        
        
        Set<String> strCollectionSet = new Set<String>{'Red', 'XXX', 'YYY','Green','Red'};
            if(strCollectionSet.size() > 0){
                System.debug('Collection Values: '+strCollectionSet);
                System.debug('Collection Size: '+strCollectionSet.size()); //What is the size of a collection, //checking the size
                System.debug('Collection isEmpty?: '+strCollectionSet.isEmpty()); //Collection is empty or not, TRUE, False
                //strCollection.clone(); //clone a collection to another
                strCollectionSet.add('ele'); //
                System.debug('After element added: '+strCollectionSet);
                //strCollectionSet.remove(2);
                //System.debug('After element removed from index 2: '+strCollectionSet);
                strCollectionSet.clear();
                System.debug('Collection Values after clear: '+strCollectionSet);
                System.debug('Collection isEmpty?: '+strCollectionSet.isEmpty()); 
            }
            
        Map<String, String> colorMap = new Map<String, String>{};
            
            //if(colorMap.size() > 0){
                //strCollection.clone(); //clone a collection to another
                colorMap.put('red', '#Red'); 
                colorMap.put('orange', '#Orange'); 
                colorMap.put('green', '#Green'); 
                colorMap.put('yellow', '#Yellow'); 
                colorMap.put('purple', '#Purple'); //
        System.debug('After element added: '+colorMap);
        System.debug('Color Map: '+colorMap);
        System.debug('Color Map values: '+colorMap.values());
        System.debug('Color Map keyset: '+colorMap.keySet());
        System.debug('Color Map Size: '+colorMap.size()); //What is the size of a collection, //checking the size
        System.debug('Color Map isEmpty?: '+colorMap.isEmpty()); //Collection is empty or not, TRUE, False
        
        
        colorMap.remove('yellow');
                System.debug('After element removed from index yellow: '+colorMap);
                colorMap.clear();
                System.debug('colorMap Values after clear: '+colorMap);
                System.debug('colorMap isEmpty?: '+colorMap.isEmpty()); 
            //}  

    }
    
    public static void playWithAccount(){
        list<Account> accList = [SELECT Id, Name, Type, AnnualRevenue FROM Account];
        
        Map<Id, Account> accountMap = new Map<Id, Account>{};
            
            for(Account acc: accList){
                accountMap.put(acc.Id, acc);
            }
        //read through
        for(Id keyId: accountMap.keySet()){
            system.debug('Account key: '+keyId);
            system.debug('Account Value: '+accountMap.get(keyId));
        }
        
        for(Account ac: accountMap.values()){
            system.debug('Account from values : '+ac);
        }
        
        
        
    }
    
    
    public static void playWithAccountChildRecords(){
        list<Account> accList = [SELECT Id, Name, Type, AnnualRevenue,
                                 (Select Id, FirstName, LastName from contacts),
                                 (Select Id, CaseNumber, Priority from cases)
                                 FROM Account];
        
        for(Account ac: accList){
            system.debug('Account record : '+ac);
            for(Contact ct: ac.contacts){
                system.debug('Associated Contact record : '+ct);
            }
            for(case cs: ac.cases){
                system.debug('Associated case record : '+cs);
            }
        }
        //Account 1
        //Contact 1
        //Contact 2
        ////Contact 3
        ////Contact n
        //accountContactMap.get(ac.Id) ==> List<Contact> 
        
    }
    
    public static void playWithChildToParent(){
       List<Contact> contacts = [Select Id, FirstName, LastName, AccountId from contact];
        Set<Id> accountIds = new Set<Id>{};
        //hitting the governor limits
        for(Contact con: contacts){
           system.debug('Given Contact: '+con);
           accountIds.add(con.AccountId);
        }
        
        
         for(Account ac: [SELECT Id, Name, Type, AnnualRevenue 
                          from Account Where Id IN: accountIds])
         {
             
             system.debug('Given Account '+ac);                            
         }
        
    }
    

    //Constructor
    public void BasicController(){
        //logic in the constructor
        system.debug('Constructor');
    }
    
    
    //Map<Id, List<Contact>>
    //
    //
    
    public void productFetch(String pname){
        this.productName = pname;
        //Private variable 
        system.debug('Passed Param: '+this.productName);
        //Public variable 
        system.debug('Product Desc: '+this.productDesc);
    }
    
}