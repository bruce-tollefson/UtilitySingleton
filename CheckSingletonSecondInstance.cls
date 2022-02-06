public class CheckSingletonSecondInstance {
    public static void singletonInstanciate(){
        UtilitySingleton instance = UtilitySingleton.getInstance();
        System.debug('isProduction: '+instance.isProduction);
    }
}