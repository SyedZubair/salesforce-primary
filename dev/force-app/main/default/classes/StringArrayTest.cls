public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer num){
        List<String> myList = new List<String>{};
            for(Integer i=0;i<num; i++){
                myList.add('* ');
            }
        
        system.debug('My List : '+myList);
            return myList;
    }

}