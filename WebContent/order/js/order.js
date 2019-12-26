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
		
		setTimeout(call_cart, 4000);
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function call_cart(){
  	  //페이지 로딩 이벤트
  	    $.ajax({
  	        type: 'POST',                   //post or get
  	        url:ctx2+'/order/call_cart',   //servlet mapping addr
  	        data: {
  	        	data : c_data
  	            },                              //key value
  	        success : function(data) {
  	        	console.log(data);
	    		let resultParse = JSON.parse(data);
	    		console.log(resultParse[0]);
	    		const tr_qty =  document.getElementsByName('tr_qty');
	    		const tr_price = document.getElementsByName('tr_price');
	    		const p_price =  document.getElementsByName('p_price');
	    		const ho_qty =  document.getElementsByName('o_qty');
	    		
	    		for(let j=0; j<resultParse.length;j++){
	    			tr_qty[j].innerHTML = resultParse[j].qty+"개";
	    			const price_innerValue = numberWithCommas(resultParse[j].qty * parseInt(p_price[j].value));
	    			tr_price[j].innerHTML = price_innerValue+"원"; 
	    			ho_qty[j].value = resultParse[j].qty;
	    		}
  	  		$('#main_contents').css("opacity","1");
  	  		$('#loader').css("display","none");
  	         }, error : function(){
  	            //에러경우
  	            console.log('에러');
  	        }
  	    })
	}
}

init();