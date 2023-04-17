public class StringArrayTest {
    public static String[] generateStringArray(Integer num){
        String[] arr1 = new String[0];
        for(Integer i = 0; i<num; i++){
            arr1.add('Test '+ String.valueOf(i));
        }    
        system.debug(arr1);
		return arr1;
    }
}