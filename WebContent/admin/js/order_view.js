const hidden_order_date = document.getElementById('hidden_order_date');
const hidden_order_number = document.getElementById('hidden_order_number');
const order_number_input = document.getElementById('order_number_input');
const order_id_input=document.getElementById('order_id_input');
const order_date_input  = document.getElementById('order_date_input');
const hidden_pay_method = document.getElementById('hidden_pay_method');
const pay_method_select = document.getElementById('pay_method_select');

window.onload = function(){
	order_number_input.innerHTML = hidden_order_number.value;
	order_date_input.innerHTML = hidden_order_date.value;
	order_id_input.innerHTML =hidden_order_id.value;
	if(hidden_pay_method.value==="신용카드"){
		pay_method_select.selectedIndex = "0"; 
	}else if(hidden_pay_method.value==="휴대폰"){
		pay_method_select.selectedIndex = "1"; 
	}else if(hidden_pay_method.value==="네이버페이"){
		pay_method_select.selectedIndex = "2"; 
	}else{
		console.log("업데이트 실패");
	}
}

window.addEventListener('click', (event) =>{
	if(event.target.innerHTML=="휴대폰" || event.target.innerHTML=="네이버페이" || event.target.innerHTML=="신용카드"){
		if(event.target.innerHTML=="휴대폰")
			hidden_pay_method.value = "휴대폰";
		else if(event.target.innerHTML=="네이버페이")
			hidden_pay_method.value = "네이버페이";
		else if(event.target.innerHTML=="신용카드")
			hidden_pay_method.value = "신용카드";
	}
});
function list() {//nowPage와 NumPerPage가지고 list.jsp로 이동 
	//기존에 action값이 지정이 되어있어도 수정 가능 
	document.listFrm.action = "order_list.jsp";
	document.listFrm.submit();
}

function confirmDel(){
	if(confirm("삭제하시겠습니까?")==true){
		document.listFrm.action = "orderDelProc.jsp";
		document.listFrm.submit();
	}else{ //취소
		return;
	}
}

function init(){
	
}
init();
