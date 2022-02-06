public class CheckSingletonWrapper {
    public static void doubleCheck(){
        CheckSingletonInstance.singletonInstanciate();
        CheckSingletonSecondInstance.singletonInstanciate();
    }
}