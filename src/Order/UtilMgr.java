package Order;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import java.text.*;

public class UtilMgr {

	 public static String getContent(String comment){
        return br("", "<br/>", comment);
   }

  public static String br(String first, String brTag, String comment){
        StringBuffer buffer = new StringBuffer();
        StringTokenizer st = new StringTokenizer(comment, "\n");
        int count = st.countTokens();
        buffer.append(first);
        int i = 1;
         while(st.hasMoreTokens()){ 
           if(i==count){
             buffer.append(st.nextToken());
           }else{ 
             buffer.append(st.nextToken()+ brTag);
		   }
           i++;
         }
       return buffer.toString(); 
  } 

  public static String monFormat(String b){//1000´ÜÀ§ Á¡Âï±â 
         String won;
		 double bb = Double.parseDouble(b); 
		 won = NumberFormat.getIntegerInstance().format(bb);
		 return won;
  }
  public static String monFormat(int b){//1000´ÜÀ§ Á¡Âï±â 
         String won;
		 double bb = b;
		 won = NumberFormat.getIntegerInstance().format(bb);
		 return won;
  }
  public static String intFormat(int i){
         String s = String.valueOf(i);
		 return monFormat(s);		  
  }
  
  //2009. 9. 28
  public static String getDay(){
	  Date now = new Date();
	  DateFormat df = DateFormat.getDateInstance();
	  return df.format(now).toString();
  }
  
  public static int parseInt(HttpServletRequest request, 
			String name) {
		return Integer.parseInt(request.getParameter(name));
	}
}
