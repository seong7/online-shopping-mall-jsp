-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.27-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 데이터 millsdb.answer_tb:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `answer_tb` DISABLE KEYS */;
INSERT INTO `answer_tb` (`q_index`, `a_index`, `a_content`, `a_date`, `a_id`) VALUES
	(1, 1, '1993년에 발송한 것으로 확인됩니다.', '2019-12-11', 'm1'),
	(1, 2, '벌써 26년 지났는데 왜 안와요?', '2019-12-11', 'u1'),
	(1, 3, '몰라요', '2019-12-11', 'm1'),
	(2, 1, '2 번 질문에 대한 답변', '2019-12-11', 'm2');
/*!40000 ALTER TABLE `answer_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.cart_tb:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cart_tb` DISABLE KEYS */;
INSERT INTO `cart_tb` (`id`, `p_code`, `c_qty`) VALUES
	('u1', 1, 20),
	('u1', 2, 20),
	('u2', 2, 100);
/*!40000 ALTER TABLE `cart_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.manager_tb:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager_tb` DISABLE KEYS */;
INSERT INTO `manager_tb` (`mgr_id`, `mgr_pwd`, `mgr_name`, `mgr_join_date`) VALUES
	('m1', '123', 'm1', '2019-12-11'),
	('m2', '123', 'm2', '2019-12-11');
/*!40000 ALTER TABLE `manager_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.notice_tb:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice_tb` DISABLE KEYS */;
INSERT INTO `notice_tb` (`n_index`, `n_id`, `n_category`, `n_title`, `n_content`, `n_date`, `n_file_name`, `n_file_size`) VALUES
	(1, 'm1', '기타', '첫 공지사항입니다.', '첫 공지사항입니다.', '2019-12-11', '', 0),
	(2, 'm2', '기타', 'test 공지사항', 'test 공지사항입니다.', '2019-12-11', '', 0);
/*!40000 ALTER TABLE `notice_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.order_detail_tb:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order_detail_tb` DISABLE KEYS */;
INSERT INTO `order_detail_tb` (`o_index`, `p_code`, `o_qty`) VALUES
	(1, 1, 1),
	(1, 2, 1),
	(2, 1, 2),
	(2, 2, 2);
/*!40000 ALTER TABLE `order_detail_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.order_tb:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order_tb` DISABLE KEYS */;
INSERT INTO `order_tb` (`o_index`, `o_id`, `o_recpt_name`, `o_recpt_contact`, `o_recpt_zipcode`, `o_recpt_add`, `o_recpt_add_det`, `o_del_msg`, `o_date`, `o_prod_amount`, `o_del_fee`, `o_total_amount`, `o_pay_method`, `o_mgr_note`, `o_status`, `o_del_num`, `o_del_date`) VALUES
	(1, 'u1', '홍길동', '010-1111-1111', 12345, '서울특별시', '이태원', '빨리주세요', '2019-12-11', 5020000, 2500, 5022500, '카드', '', '결제완료', 'asd124d1', '2019-12-11'),
	(2, 'u2', '동길홍', '010-2222-2222', 54321, '대전광역시', '마ㅓㄴ', '부재시 반납해주세요.', '2019-12-11', 10040000, 2500, 10042500, '무통장입금', '빠른배송필요', '배송준비', '123asdv1', '2019-12-11');
/*!40000 ALTER TABLE `order_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.page_connection_tb:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `page_connection_tb` DISABLE KEYS */;
INSERT INTO `page_connection_tb` (`c_index`, `c_id`, `c_time`, `c_ip`) VALUES
	(1, 'u1', '2019-12-11 16:49:55', '192.168.0.85'),
	(2, 'u2', '2019-12-11 16:50:14', '192.168.0.70');
/*!40000 ALTER TABLE `page_connection_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.point_tb:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `point_tb` DISABLE KEYS */;
INSERT INTO `point_tb` (`pt_index`, `id`, `o_index`, `pt_detail`, `pt_date`, `pt_point`, `pt_category`) VALUES
	(0, 'u1', 1, '[구매적립] (주문번호: 1) 5% 적립', '2019-12-11', 100, '구매적립');
/*!40000 ALTER TABLE `point_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.policy_tb:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `policy_tb` DISABLE KEYS */;
INSERT INTO `policy_tb` (`pl_change_id`, `pl_point_rate`, `pl_point_min`) VALUES
	('m1', 5, 2000);
/*!40000 ALTER TABLE `policy_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.product_mst_tb:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product_mst_tb` DISABLE KEYS */;
INSERT INTO `product_mst_tb` (`p_code`, `p_name`, `p_price`, `p_main_pht_name`, `p_main_pht_size`, `p_detail_pht_name`, `p_detail_pht_size`, `p_info_pht_name`, `p_info_pht_size`, `p_date`, `p_on_sale`) VALUES
	(1, '[제주특산품] 오메기떡', 500000, 'xxx.jpeg', 1231231, 'xxxx.png', 123123, 'xx.png', 332123123, '2019-12-11', 0),
	(2, '[한정판매]시루떡', 20000, 'pp.jpeg', 1231231, 'ss.jpeg', 2132323232, 'qq.png', 2929, '2019-12-11', 1);
/*!40000 ALTER TABLE `product_mst_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.question_tb:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question_tb` DISABLE KEYS */;
INSERT INTO `question_tb` (`q_index`, `q_id`, `q_category`, `q_title`, `q_question`, `q_date`, `q_file_name`, `q_file_size`) VALUES
	(1, 'u1', '배송문의', '배송이 안옵니다.', '1992년에 주문했는데 배송이 안옵니다.', '2019-12-11', '', 0),
	(2, 'u2', '기타', 'test 문의입니다.', 'test 문의 내용', '2019-12-11', '', 0),
	(3, 'u2', '반품신청', '시루떡 2개 반품해주세요', '시루떡 2개 반품해주세요!!', '2019-12-11', '', 0);
/*!40000 ALTER TABLE `question_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.rawmaterial_tb:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `rawmaterial_tb` DISABLE KEYS */;
INSERT INTO `rawmaterial_tb` (`rm_code`, `rm_name`) VALUES
	(1, '팥'),
	(2, '찹쌀'),
	(3, '대두'),
	(4, '전분');
/*!40000 ALTER TABLE `rawmaterial_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.return_tb:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `return_tb` DISABLE KEYS */;
INSERT INTO `return_tb` (`o_index`, `p_code`, `q_index`, `rt_category`, `rt_qty`, `rt_reason`) VALUES
	(2, 2, 3, '환불', 1, '제품하자');
/*!40000 ALTER TABLE `return_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.review_tb:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review_tb` DISABLE KEYS */;
INSERT INTO `review_tb` (`o_index`, `p_code`, `id`, `r_content`, `r_pht_name`, `r_pht_size`, `r_rate`) VALUES
	(1, 1, 'u1', '맛있어요', 'xx.png', 12341, 5),
	(1, 2, 'u1', '맛 없어요', 'xxbv.png', 1231241, 2),
	(2, 1, 'u2', '굿', '', 0, 4);
/*!40000 ALTER TABLE `review_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.rm_pct_tb:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `rm_pct_tb` DISABLE KEYS */;
INSERT INTO `rm_pct_tb` (`p_code`, `rm_code`, `rm_percentage`) VALUES
	(1, 1, 30),
	(1, 2, 40),
	(1, 3, 20),
	(1, 4, 10),
	(2, 1, 5),
	(2, 2, 10),
	(2, 3, 3),
	(2, 4, 10);
/*!40000 ALTER TABLE `rm_pct_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.stock_tb:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `stock_tb` DISABLE KEYS */;
INSERT INTO `stock_tb` (`p_code`, `st_exp_date`, `st_enter_qty`, `st_ava_qty`, `st_waste_qty`) VALUES
	(1, '2020-01-31', 1000, 100, 0),
	(2, '2019-01-21', 1000, 100, 0);
/*!40000 ALTER TABLE `stock_tb` ENABLE KEYS */;

-- 테이블 데이터 millsdb.user_tb:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;
INSERT INTO `user_tb` (`id`, `pwd`, `NAME`, `birthday`, `email`, `contact`, `zipcode`, `address`, `address_detail`, `join_date`) VALUES
	('u1', '123', 'u1', '2019-12-11', 'u1@naver.com', '010-1111-1111', 12345, '부산광역시ㅇㅇㅇ', '서면', '2019-12-11'),
	('u2', '123', 'u2', '2019-12-11', 'u2@gmail.com', '010-222-2222', 12345, '김해시', '김해김해', '2019-12-11');
/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
