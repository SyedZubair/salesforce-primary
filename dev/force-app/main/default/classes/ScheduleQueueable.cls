public class ScheduleQueueable implements Schedulable{

   public void execute(SchedulableContext scon){
        System.debug('Hello Execution');
    }
}