public class Future_Example {
	@future
    public static void call(){
        system.debug('Call one');
        system.debug('Call Two');
        system.debug('Call Three');
    }
    
     public void invoke(){
        system.debug('invoke one');
        system.debug('invoke Two');
        system.debug('invoke Three');
    }
    
        public void show(){
        system.debug('show one');
        system.debug('show Two');
            call();
        system.debug('show Three');
        system.debug('show four');
            invoke();
        system.debug('show five');
        system.debug('show six');
    }
}