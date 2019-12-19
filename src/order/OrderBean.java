package order;

public class OrderBean {
	private int o_index;
	private String o_id;
	private String o_recpt_name;
	private String o_recpt_contact; //수령자 전화번호
	private String o_recpt_zipcode;
	private String o_recpt_add;
	private String o_recpt_add_det;//수령자 상세주소 
	private String o_del_msg;//배송 메세지 
	private String o_date;//주문일시
	private int o_prod_amount; //총 상품 금액 
	private int o_del_fee;//배송비 
	private int o_total_amount; //총 결재 금액 
	private String o_pay_method;
	private String o_mgr_note;//관리자 메모 
	private String o_status;//주문상태
	private String o_del_num;//송장번호 
	private String o_del_date;//발송일 
	
	public int getO_index() {
		return o_index;
	}
	public void setO_index(int o_index) {
		this.o_index = o_index;
	}
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public String getO_recpt_name() {
		return o_recpt_name;
	}
	public void setO_recpt_name(String o_recpt_name) {
		this.o_recpt_name = o_recpt_name;
	}
	public String getO_recpt_contact() {
		return o_recpt_contact;
	}
	public void setO_recpt_contact(String o_recpt_contact) {
		this.o_recpt_contact = o_recpt_contact;
	}
	public String getO_recpt_zipcode() {
		return o_recpt_zipcode;
	}
	public void setO_recpt_zipcode(String o_recpt_zipcode) {
		this.o_recpt_zipcode = o_recpt_zipcode;
	}
	public String getO_recpt_add() {
		return o_recpt_add;
	}
	public void setO_recpt_add(String o_recpt_add) {
		this.o_recpt_add = o_recpt_add;
	}
	public String getO_recpt_add_det() {
		return o_recpt_add_det;
	}
	public void setO_recpt_add_det(String o_recpt_add_det) {
		this.o_recpt_add_det = o_recpt_add_det;
	}
	public String getO_del_msg() {
		return o_del_msg;
	}
	public void setO_del_msg(String o_del_msg) {
		this.o_del_msg = o_del_msg;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getO_prod_amount() {
		return o_prod_amount;
	}
	public void setO_prod_amount(int o_prod_amount) {
		this.o_prod_amount = o_prod_amount;
	}
	public int getO_del_fee() {
		return o_del_fee;
	}
	public void setO_del_fee(int o_del_fee) {
		this.o_del_fee = o_del_fee;
	}
	public int getO_total_amount() {
		return o_total_amount;
	}
	public void setO_total_amount(int o_total_amount) {
		this.o_total_amount = o_total_amount;
	}
	public String getO_pay_method() {
		return o_pay_method;
	}
	public void setO_pay_method(String o_pay_method) {
		this.o_pay_method = o_pay_method;
	}
	public String getO_mgr_note() {
		return o_mgr_note;
	}
	public void setO_mgr_note(String o_mgr_note) {
		this.o_mgr_note = o_mgr_note;
	}
	public String getO_status() {
		return o_status;
	}
	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	public String getO_del_num() {
		return o_del_num;
	}
	public void setO_del_num(String o_del_num) {
		this.o_del_num = o_del_num;
	}
	public String getO_del_date() {
		return o_del_date;
	}
	public void setO_del_date(String o_del_date) {
		this.o_del_date = o_del_date;
	}
	
	
}
