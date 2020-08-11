public class Queue_Example1 implements Queueable{
    public void execute(QueueableContext ac){
        system.debug('insecond queue');
       Queue q1 = new Queue();
       Id jobid =  System.enqueueJob(q1);
        Account a = new Account();
        a.Name = 'From Queue2';
        insert a;
    }

}