public class UtilitySingleton {
    // private static variable referencing the class
    private static UtilitySingleton instance = null;
    public Boolean isProduction {get;private set;} // checks if the org is a production org
 
    // The constructor is private and initializes the id of the record type
    private UtilitySingleton(){
        isProduction = ![Select isSandbox from Organization].isSandbox;
    }
    // a static method that returns the instance of the record type
    public static UtilitySingleton getInstance(){
        // lazy load the record type - only initialize if it doesn't already exist
        if(instance == null) instance = new UtilitySingleton();
        return instance;
    }
}