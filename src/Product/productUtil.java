package Product;

import java.text.DecimalFormat;

public class productUtil {
	
	
	public String price(int price) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		return formatter.format(price);
	}
	
}
