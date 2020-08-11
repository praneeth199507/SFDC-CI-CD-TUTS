public class Queue implements Queueable {
    public void execute(QueueableContext ac){
        system.debug('infirst queue');
        Account a = new Account();
        a.Name = 'From Queue1';
        insert a;
        system.debug(a.Id+a.Name);
    }

}