package Order;

public class AdminOrderBean {
	private int o_index;
	private String o_del_date;
	private int o_total_amount;
	private String p_name;
	private String o_status;
	private int product_count;
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getO_index() {
		return o_index;
	}
	public void setO_index(int o_index) {
		this.o_index = o_index;
	}
	public String getO_del_date() {
		return o_del_date;
	}
	public void setO_del_date(String o_del_date) {
		this.o_del_date = o_del_date;
	}
	public int getO_total_amount() {
		return o_total_amount;
	}
	public void setO_total_amount(int o_total_amount) {
		this.o_total_amount = o_total_amount;
	}
	public String getO_status() {
		return o_status;
	}
	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public int getRt_qty() {
		return rt_qty;
	}
	public void setRt_qty(int rt_qty) {
		this.rt_qty = rt_qty;
	}
	private int rt_qty;		//반품개수인데 반품여부 확인용

}
