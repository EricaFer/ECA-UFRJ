public class Main
{
	public static void main(String[] args) {
	    
	    try{
            	try{
                	System.out.println("0");
                	throw new Exception("A");
            	}
            	catch(Exception e){
                	System.out.println("1");
                	throw new Exception("B");
            	}
            	finally{
            	System.out.println("2");
            	}
        }

            catch(Exception e){
            	System.out.println("3");
        }

}
}