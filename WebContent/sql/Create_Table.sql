/*/////////////////////////*/
/*/////  mills DB ////////*/
/*///////////////////////*/

/* millsdb 생성 */
CREATE DATABASE if NOT EXISTS millsdb ;

/* millsdb 접속 */
USE millsdb;



/***** member 영역 ******/
/************************/

/* 회원테이블 */
CREATE TABLE IF NOT EXISTS USER_TB(
id CHAR(20),
pwd CHAR(20) NOT NULL,
NAME CHAR(10) NOT NULL,
birthday DATE NOT NULL,
email CHAR(40) NOT NULL,
contact CHAR(13) NOT NULL,
zipcode INT(5) NOT NULL,
address CHAR(50) NOT NULL,
address_detail CHAR(20) NOT NULL,
join_date DATE NOT NULL,
PRIMARY KEY (id)
)COLLATE='euckr_korean_ci';

/* 접속관리 테이블  */
CREATE TABLE IF NOT EXISTS PAGE_CONNECTION_TB(
c_index INT auto_increment,
c_id CHAR(20) NOT NULL,
c_time TIMESTAMP DEFAULT NOW(),
c_ip CHAR(13) NOT NULL,
PRIMARY KEY(c_index),
FOREIGN KEY(c_id) REFERENCES user_tb(id)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';


/* 관리자 테이블 */
CREATE TABLE IF NOT EXISTS MANAGER_TB(
mgr_id CHAR(20),
mgr_pwd CHAR(20) NOT NULL,
mgr_name CHAR(10) NOT NULL,
mgr_join_date DATE NOT NULL,
PRIMARY KEY(mgr_id)
)COLLATE='euckr_korean_ci';


/* 관리정책 테이블 */ 
CREATE TABLE IF NOT EXISTS POLICY_TB(
pl_change_id CHAR(20),
pl_point_rate INT(2) NOT NULL,
pl_point_min INT(5) NOT NULL,
FOREIGN KEY(pl_change_id) REFERENCES manager_tb(mgr_id)
ON UPDATE cascade
)COLLATE='euckr_korean_ci';


/* 공지사항 테이블 */
CREATE TABLE IF NOT EXISTS NOTICE_TB(
n_index INT auto_increment,
n_id CHAR(20) NOT NULL,
n_category CHAR(30) NOT NULL,
n_title CHAR(40) NOT NULL,
n_content TEXT NOT NULL,
n_date DATE NOT NULL,
n_file_name VARCHAR(30) NOT NULL default '',
n_file_size INT(11) NOT NULL default 0,
PRIMARY KEY(n_index),
FOREIGN KEY(n_id) REFERENCES manager_tb(mgr_id)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';


/* 질문 테이블 */
CREATE TABLE IF NOT EXISTS QUESTION_TB(
q_index INT AUTO_increment,
q_id CHAR(20) NOT NULL,
q_category CHAR(30) NOT NULL,
q_title CHAR(40) NOT NULL,
q_question TEXT NOT NULL,
q_date DATE NOT NULL,
q_file_name VARCHAR(30) NOT NULL default '',
q_file_size INT(11) NOT NULL default 0,
PRIMARY KEY(q_index),
FOREIGN KEY(q_id) REFERENCES user_tb(id)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';

/* 답변 테이블 */
CREATE TABLE IF NOT EXISTS ANSWER_TB(
q_index INT,
a_index INT,
a_content TEXT NOT NULL,
a_date DATE NOT NULL,
a_id CHAR(20) NOT NULL,
PRIMARY KEY(q_index, a_index),
FOREIGN KEY(q_index) REFERENCES QUESTION_TB(q_index)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';






/*************************/
/***** product 영역 ******/

/* 제품마스터 테이블 */
CREATE TABLE IF NOT EXISTS PRODUCT_MST_TB(
p_code INT AUTO_INCREMENT,
p_name CHAR(30) NOT NULL,
p_price INT(10) NOT NULL,
p_main_pht_name VARCHAR(30) NOT NULL default '',
p_main_pht_size INT(11) NOT NULL default 0,
p_detail_pht_name VARCHAR(30) NOT NULL default '',
p_detail_pht_size INT(11) NOT NULL default 0,
p_info_pht_name VARCHAR(30) NOT NULL default '',
p_info_pht_size INT(11) NOT NULL default 0,
p_date DATE NOT NULL,
p_on_sale INT(1) DEFAULT 0,
PRIMARY KEY(p_code)
)COLLATE='euckr_korean_ci';


/* 재고 테이블 */
CREATE TABLE IF NOT EXISTS STOCK_TB(
p_code INT,
st_exp_date DATE,
st_enter_qty INT(5) NOT NULL,
st_ava_qty INT(5) NOT NULL,
st_waste_qty INT(5) NOT NULL default 0,
PRIMARY KEY(p_code, st_exp_date),
FOREIGN KEY(p_code) REFERENCES PRODUCT_MST_TB(p_code)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';


/* 원재료 테이블 */
CREATE TABLE if NOT EXISTS RAWMATERIAL_TB(
rm_code INT AUTO_INCREMENT,
rm_name CHAR(20) NOT NULL,
PRIMARY KEY(rm_code)
)COLLATE='euckr_korean_ci';

/* 원재료 함량율 테이블 */
CREATE TABLE IF NOT EXISTS RM_PCT_TB(
p_code INT,
rm_code INT,
rm_percentage INT(2) NOT NULL default 0,
PRIMARY KEY(p_code, rm_code),
FOREIGN KEY(p_code) REFERENCES PRODUCT_MST_TB(p_code)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(rm_code) REFERENCES RAWMATERIAL_TB(rm_code)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';




/*************************/
/***** order 영역 *******/


/* 통합 주문 테이블 */
CREATE TABLE IF NOT EXISTS ORDER_TB(
o_index INT AUTO_INCREMENT,
o_id CHAR(20) NOT NULL,
o_recpt_name CHAR(10) NOT NULL,
o_recpt_contact CHAR(13) NOT NULL,
o_recpt_zipcode INT(5) NOT NULL,
o_recpt_add CHAR(50) NOT NULL,
o_recpt_add_det CHAR(20) NOT NULL,
o_del_msg CHAR(50) NOT NULL default '',
o_date DATE NOT NULL,
o_prod_amount INT(8) NOT NULL,
o_del_fee INT(5) NOT NULL default 0,
o_total_amount INT(8) NOT NULL,
o_pay_method CHAR(10) NOT NULL,
o_mgr_note CHAR(50) NOT NULL default '',
o_status CHAR(10) NOT NULL default '',
o_del_num CHAR(25) NOT NULL default '',
o_del_date DATE NOT NULL,
PRIMARY KEY(o_index),
FOREIGN KEY(o_id) REFERENCES USER_TB(id)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';


/* 주문 상세 테이블 */
CREATE TABLE IF NOT EXISTS ORDER_DETAIL_TB(
o_index INT,
p_code INT,
o_qty INT(5) NOT NULL,
PRIMARY KEY(o_index, p_code),
FOREIGN KEY(o_index) REFERENCES ORDER_TB(o_index)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(p_code) REFERENCES PRODUCT_MST_TB(p_code)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';


/* 리뷰 테이블 */
CREATE TABLE IF NOT EXISTS REVIEW_TB(
o_index INT,
p_code INT,
id CHAR(20) NOT NULL,
r_content TEXT NOT NULL,
r_pht_name VARCHAR(30) NOT NULL default '',
r_pht_size INT(11) NOT NULL default 0,
r_rate INT(1) NOT NULL default 0,
PRIMARY KEY(o_index, p_code),
FOREIGN KEY(o_index, p_code) REFERENCES ORDER_DETAIL_TB(o_index, p_code)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';


/* 장바구니 테이블 */
CREATE TABLE IF NOT EXISTS CART_TB(
id CHAR(20),
p_code INT,
c_qty INT(5) NOT NULL,
PRIMARY KEY(id, p_code),
FOREIGN KEY(id) REFERENCES USER_TB(id)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(p_code) REFERENCES PRODUCT_MST_TB(p_code)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';


/* 포인트 내역 테이블 */
CREATE TABLE IF NOT EXISTS POINT_TB(
pt_index INT,
id CHAR(20) NOT NULL,
o_index INT NOT NULL,
pt_detail CHAR(50) NOT NULL default '',
pt_date DATE NOT NULL,
pt_point INT(8) NOT NULL default 0,
pt_category CHAR(20) NOT NULL default '',
PRIMARY KEY(pt_index),
FOREIGN KEY(id) REFERENCES USER_TB(ID)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(o_index) REFERENCES ORDER_TB(o_index)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';


/* 반품 테이블 */
CREATE TABLE IF NOT EXISTS RETURN_TB(
o_index INT,
p_code INT,
q_index INT NOT NULL,
rt_category CHAR(20) NOT NULL,
rt_qty INT(5) NOT NULL,
rt_reason CHAR(50) NOT NULL default '',
PRIMARY KEY(o_index, p_code),
FOREIGN KEY(o_index) REFERENCES ORDER_DETAIL_TB(o_index)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(p_code) REFERENCES ORDER_DETAIL_TB(p_code)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(q_index) REFERENCES QUESTION_TB(q_index)
ON UPDATE CASCADE ON DELETE CASCADE
)COLLATE='euckr_korean_ci';
