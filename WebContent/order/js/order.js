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
			document.orderFrm.submit();
			}else{ 
			alert("약관에 동의해주세요.");
			return;
		}
	}
function init(){
	const point_span = document.getElementById('point_span');
	const point_input = document.getElementById('point_input');
	const point_buffer = document.getElementById('point_buffer').value;
	const o_total_amount = document.getElementById('o_total_amount');
	const firstValue = uncomma(o_total_amount.innerHTML);
	const total_target_input = document.getElementById('total_target_input');
	
	point_input.addEventListener("keydown", FilterInput);
	point_input.addEventListener("paste", handlePaste);
	

	function FilterInput(event) {
	    var keyCode = ('which' in event) ? event.which : event.keyCode;

	    isNotWanted = (keyCode == 69 || keyCode == 101);
	    return !isNotWanted;
	};
		function handlePaste (e) {
	    var clipboardData, pastedData;

	    // Get pasted data via clipboard API
	    clipboardData = e.clipboardData || window.clipboardData;
	    pastedData = clipboardData.getData('Text').toUpperCase();

	    if(pastedData.indexOf('E')>-1) {
	        //alert('found an E');
	        e.stopPropagation();
	        e.preventDefault();
	    }
	};

	
	point_input.value = '';
	point_input.addEventListener('keypress', onlyNumber);
	point_input.addEventListener('focusout', function(){
		let maxPoint = parseInt(uncomma(point_buffer));
		if(point_input.value==='0'){
			point_input.value = '';
			point_span.innerHTML = 0;
			o_total_amount.innerHTML = numberWithCommas(firstValue);
			return;
		}
		if(isNaN(parseInt(point_input.value))){
			alert("숫자를 입력해주세요.");
			point_input.value = '';
			point_span.innerHTML = 0;
			o_total_amount.innerHTML = numberWithCommas(firstValue);
			point_input.focus();
			return;
		}
		if(maxPoint < parseInt(point_input.value)){
			alert(maxPoint+"원까지 사용가능합니다.");
			point_input.value = '';
			point_span.innerHTML = 0;
			o_total_amount.innerHTML = numberWithCommas(firstValue);
			console.log("이벤트 온");
			point_input.focus();
			return;
		}
		total_target_input.value = parseInt(uncomma(o_total_amount.innerHTML))- parseInt(point_input.value);
		point_span.innerHTML = "-"+ numberWithCommas(point_input.value);
		o_total_amount.innerHTML = numberWithCommas(parseInt(uncomma(o_total_amount.innerHTML))- parseInt(point_input.value)) ;
	});
	point_input.max = point_buffer;
	const order_id = null;
	let array_list = new Array;
	let c_data = null;
	const ctx2 = getContextPath();
	function onlyNumber(event){
		let pointzerodata = point_input.value;
		point_input.value = pointzerodata.replace(/(^0+)/, "");
	}
	window.onload = function(){
		const order_id = document.getElementById('order_id').value;
		let code_name = document.getElementsByName('p_code_array');
		for(let i=0; i<code_name.length;i++){         
			let array_obj = new Object() ;
			array_obj.id = order_id;
			array_obj.code = code_name[i].value;
			array_list.push(array_obj);
		}
		
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function uncomma(str) {
  	    str = String(str);
  	    return str.replace(/[^\d]+/g, '');
  	}


}

init();