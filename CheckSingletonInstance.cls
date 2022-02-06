public class CheckSingletonInstance {
    public static void singletonInstanciate(){
        UtilitySingleton instance = UtilitySingleton.getInstance();
        System.debug('isProduction: '+instance.isProduction);
    }
}