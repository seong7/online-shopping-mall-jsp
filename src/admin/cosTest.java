package admin;

import java.util.ArrayList;

import org.json.simple.ItemList;

public class cosTest {
	
	   static double computeCosSim(ArrayList<Item> itemsA,ArrayList<Item> itemsB){
	        double up = 0d;
	        double down = 0d;
	        
	        int lenOfA = itemsA.size();
	        int lenOfB = itemsB.size();
	        
	        int bottomA = 0;
	        int bottomB = 0;
	        
	        int currentA = 0,currentB = 0;
	        
	        
	        while(currentA < lenOfA && currentB < lenOfB){
	            
	            if(itemsA.get(currentA).item == itemsB.get(currentB).item){
	                up += itemsA.get(currentA).rate * itemsB.get(currentB).rate;
	                bottomA += Math.pow(itemsA.get(currentA++).rate,2);
	                bottomB += Math.pow(itemsB.get(currentB++).rate,2);                
	                
	            }else if(itemsA.get(currentA).item > itemsB.get(currentB).item){
	                bottomB += Math.pow(itemsB.get(currentB++).rate,2);            
	            }else{
	                bottomA += Math.pow(itemsA.get(currentA++).rate,2);
	            }            
	        }
	        
	        
	        while(currentA < lenOfA)
	            bottomA += Math.pow(itemsA.get(currentA++).rate,2);
	        
	        while(currentB < lenOfB)
	            bottomB += Math.pow(itemsB.get(currentB++).rate,2);    
	        
	    
	        return up/(Math.sqrt(bottomA)*Math.sqrt(bottomB));
	    }
	    
	    static class Item{
	        int item;
	        int rate;
	        public Item(int item,int rate){
	            this.item = item;
	            this.rate = rate;
	        }
	    }
	    public static void main(String[] args) {
	    	Item a1 = new Item(1, 40);
	    	Item a2 = new Item(2, 60);
	    	Item a3 = new Item(3, 30);
	    	Item a4 = new Item(4, 0);
	    	ArrayList<Item> item1 = new ArrayList<Item>();
	    	ArrayList<Item> item2 = new ArrayList<Item>();
	    	item1.add(a1);
	    	item1.add(a2);
	    	a1.rate = 30;
	    	a2.rate = 30;
	    	
	    	
	    	item2.add(a1);
	    	item2.add(a2);
	    	item2.add(a3);
	    	double result = computeCosSim(item1, item2);
	    	System.out.println(result);
		}
}
