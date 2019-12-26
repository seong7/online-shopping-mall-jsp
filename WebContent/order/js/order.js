function paymentMethod(value){//결제방법 변경 시 입력창 변경 
		if(value=='신용카드'){tr1.style.display = '';
			tr2.style.display = 'none';
		}
		else if(value=='휴대폰'){
			tr1.style.display = 'none';
			tr2.style.display = '';
		}
		else{
			tr1.style.display = 'none';
			tr2.style.display = 'none';
		}
	}
	function agreement(){//약관 미 동의시 진행안됨. 
		var chk = document.getElementById("agreement");
		if(chk.checked){
			document.write("<h3>결재가 완료되었습니다.</h3>");
		}else{ 
			alert("약관에 동의해주세요.");
			return;
		}
	}
function init(){

	const order_id = null;
	let array_list = new Array;
	let c_data = null;
	const ctx2 = getContextPath();
	
	window.onload = function(){
		const order_id = document.getElementById('order_id').value;
		let code_name = document.getElementsByName('p_code_array');
		for(let i=0; i<code_name.length;i++){         
			let array_obj = new Object() ;
			array_obj.id = order_id;
			array_obj.code = code_name[i].value;
			array_list.push(array_obj);
		}
		console.log(array_list);
		c_data = JSON.stringify(array_list);
		console.log(c_data);
		console.log(order_id);
		
	
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

}

init();