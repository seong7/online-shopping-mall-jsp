package order;

public class AdminOrderBean {
	private int o_index;
	private int p_code;
	private String o_del_date;
	private String o_status;
	private int product_count;
	private int o_total_amount;
	public int getO_index() {
		return o_index;
	}
	public void setO_index(int o_index) {
		this.o_index = o_index;
	}
	public int getP_code() {
		return p_code;
	}
	public int getO_total_amount() {
		return o_total_amount;
	}
	public void setO_total_amount(int o_total_amount) {
		this.o_total_amount = o_total_amount;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getO_del_date() {
		return o_del_date;
	}
	public void setO_del_date(String o_del_date) {
		this.o_del_date = o_del_date;
	}
	public int getProduct_count() {
		return product_count;
	}
	public String getO_status() {
		return o_status;
	}
	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	} 
}
