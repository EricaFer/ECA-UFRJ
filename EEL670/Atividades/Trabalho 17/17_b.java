public class Main
{
	public static void main(String[] args) {
	    try{
            	try{
                	System.out.println("0");
                	throw new Exception("A");
            	}
            	/* Catch funciona mas n para a exception necessaria*/
            	catch(ArrayIndexOutOfBoundsException a){
                	System.out.println("1");
            	}
       	 	}
           catch(Exception e){
           	System.out.println("2");
        	}
           finally{
            System.out.println("3");
           }
	}
}