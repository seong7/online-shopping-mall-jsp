package product;

public class ReviewBean {
	
	/* review_tb columns */
	private int o_index;
	private int p_code;
	private String id;
	private String r_content;
	private String r_pht_name;
	private int r_pht_size;
	private int r_rate;
	
	/* 작성가능한 주문 건 출력 용  */	
	private String p_main_pht_name;
	private String p_name;
	private String o_date;
	private String o_status;
	
	
	public int getO_index() {
		return o_index;
	}
	public void setO_index(int o_index) {
		this.o_index = o_index;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_pht_name() {
		return r_pht_name;
	}
	public void setR_pht_name(String r_pht_name) {
		this.r_pht_name = r_pht_name;
	}
	public int getR_pht_size() {
		return r_pht_size;
	}
	public void setR_pht_size(int r_pht_size) {
		this.r_pht_size = r_pht_size;
	}
	public int getR_rate() {
		return r_rate;
	}
	public void setR_rate(int r_rate) {
		this.r_rate = r_rate;
	}
	public String getP_main_pht_name() {
		return p_main_pht_name;
	}
	public void setP_main_pht_name(String p_main_pht_name) {
		this.p_main_pht_name = p_main_pht_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getO_status() {
		return o_status;
	}
	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	
	
	
}
