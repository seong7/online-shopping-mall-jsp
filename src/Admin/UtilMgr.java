package Admin;

import java.io.File;
import java.text.NumberFormat;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

public class UtilMgr {

	public static String replace(String str, String pattern, String replace) {
		int s = 0, e = 0;
		StringBuffer result = new StringBuffer();

		while ((e = str.indexOf(pattern, s)) >= 0) {
			result.append(str.substring(s, e));
			result.append(replace);
			s = e + pattern.length();
		}
		result.append(str.substring(s));
		return result.toString();
	}

	public static void delete(String s) {
		File file = new File(s);
		if (file.isFile()) {
			file.delete();
		}
	}

	public static String con(String s) {
		String str = null;
		try {
			str = new String(s.getBytes("8859_1"), "ksc5601");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

	public static String monFormat(String b) {
		String won;
		double bb = Double.parseDouble(b);
		won = NumberFormat.getIntegerInstance().format(bb);
		return won;
	}

	public static String monFormat(int b) {
		String won;
		double bb = b;
		won = NumberFormat.getIntegerInstance().format(bb);
		return won;
	}

	public static String intFormat(int i) {
		String s = String.valueOf(i);
		return monFormat(s);
	}
	
	public static String getKBytes(int i) {
		i = i/1000;
		return monFormat(i);
	}
	
	public static int parseInt(HttpServletRequest request, 
			String name) {
		return Integer.parseInt(request.getParameter(name));
	}
}