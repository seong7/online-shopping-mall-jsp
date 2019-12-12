package Product;

public class ProductMgr {
	
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/online-shopping-mall-jsp/WebContent/productdata/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;
	
	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}
}
