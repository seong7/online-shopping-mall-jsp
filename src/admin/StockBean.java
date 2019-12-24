package admin;

public class StockBean {
	private int p_code;
	private String st_exp_date;
	private int st_enter_qty;
	private int st_ava_qty;
	private int st_waste_qty;
	private String p_name;
	private int TimestampDiff;
	
	
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getSt_exp_date() {
		return st_exp_date;
	}
	public void setSt_exp_date(String st_exp_date) {
		this.st_exp_date = st_exp_date;
	}
	public int getSt_enter_qty() {
		return st_enter_qty;
	}
	public void setSt_enter_qty(int st_enter_qty) {
		this.st_enter_qty = st_enter_qty;
	}
	public int getSt_ava_qty() {
		return st_ava_qty;
	}
	public void setSt_ava_qty(int st_ava_qty) {
		this.st_ava_qty = st_ava_qty;
	}
	public int getSt_waste_qty() {
		return st_waste_qty;
	}
	public void setSt_waste_qty(int st_waste_qty) {
		this.st_waste_qty = st_waste_qty;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getTimestampDiff() {
		return TimestampDiff;
	}
	public void setTimestampDiff(int timestampDiff) {
		TimestampDiff = timestampDiff;
	}
	
	
}
