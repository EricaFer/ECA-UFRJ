public class IntList {
	 private ConsCell start; // list head, or null
	 
	 public IntList(ConsCell s) {    
		 
		 start = s;  
	 }
	 
	 public IntList cons (int h) {  
		 
		 return new IntList(new ConsCell(h,start));  
	 }

	 public int length() {  
		 
		 int len = 0;   
		 ConsCell cell = start;    
		 while (cell != null) { 
			 // while not at end of list      
			 len++;      
			 cell = cell.getTail();    
			 }    
		 return len; 
	 } 
	 	 
	 public void print() {    
		 System.out.print("[");    
		 ConsCell a = start;    
		 while (a != null) {      
			 System.out.print(a.getHead());      
			 a = a.getTail();      
			 if (a != null) System.out.print(",");    
			 }    
		 System.out.println("]");  
	 }
	 
	 public IntList appendR(IntList y) {
		 
		if (length() > 1) {
			
			IntList b = new IntList(start.getTail()).append(y);				
			return b.cons(start.getHead());			
		}		
		
		else return y.cons(start.getHead());			
				 
	 }
	 
	 public IntList append(IntList y) {
		 
		ConsCell a = start;
		IntList reverse = new IntList(null);
		IntList answer = y;
		
		while(a!= null) {
			reverse = reverse.cons(a.getHead());
			a = a.getTail();

		}
			
		while(reverse.start != null) {
			
			answer = answer.cons(reverse.start.getHead());
						reverse = new IntList(reverse.start.getTail()); 
		}
		
		return answer;
			
	 }
}
