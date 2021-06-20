public class Main
{
	public static void main(String[] args) {
	    
	    try {
    		try {
    		    /* println (assim como em Julia) printa e pula linha */
    		    System.out.println("0");
    		}
    	    /*Nothing to cacth here*/
    	    catch(Exception e){
    	        System.out.println("1");
    	    }
    	    finally {
            System.out.println("2");
            throw new Exception("A");
    	    }
	    }
	    
	    catch(Exception e){
	        System.out.println("3");
		}
	}
}