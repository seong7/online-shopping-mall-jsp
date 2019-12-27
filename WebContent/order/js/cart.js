
let submitflag = '';
function init(){	
	const cart_rows = document.getElementById("cart_table").rows;
	const delete_btn = document.querySelector('#delete_product');
	const order_btn = document.querySelector('#order_product');
	const allCheckbox = cart_rows[0].childNodes[1].firstChild;
	const sumtext = document.querySelector('#sumtext');
	let id = '';
	order_btn.addEventListener('click', function(){
		goOrder();
	});
	
	window.onload = function(){
		id = document.querySelector('#user_id').value;
		setTimeout(call_qty, 2500);
	}
	
	if (window.attachEvent) {
	    /*IE and Opera*/
	    window.attachEvent("onunload", function() {
			if(!submitflag){
				update_qty();
				console.log('업데이트 실행1');
			}
	    });

	} else if (document.addEventListener) {
	    /*Chrome, FireFox*/
	    window.onbeforeunload = function() {
			if(!submitflag){
				update_qty();
				console.log('업데이트 실행2');
			}
	    };
	    /*IE 6, Mobile Safari, Chrome Mobile*/
	    window.addEventListener("unload", function() {
			if(!submitflag){
				update_qty();
				console.log('업데이트 실행3');
			}
	    }, false);
	} else {
	    /*etc*/
	    document.addEventListener("unload", function() {
			if(!submitflag){
				update_qty();
				console.log('업데이트 실행4');
			}
	    }, false);
	}


    
	
	delete_btn.addEventListener('click',confirmDel);
	let trArray = [];
	let sum = 0;
	//tr Array에 tr 배열 넣어줌(첫행 제외)
	for(let i=0; i<cart_rows.length; i++){
	    if(i!==0)  {
	    	trArray.push(cart_rows[i]);
	    }
	    cart_rows[i].childNodes[1].firstChild.checked = false;
	}
    console.log('체크박스 전체 해제 완료');
    
	for(let j=0; j<trArray.length; j++){
		const tr7 = trArray[j].childNodes[7];
		const down_btn = tr7.childNodes[0];
		let qty_input = tr7.childNodes[2];
		const up_btn = tr7.childNodes[4];
		let product_cash = parseInt(trArray[j].childNodes[5].childNodes[2].innerHTML);
		let total_cash = trArray[j].childNodes[9];	
		
		//체크박스 이벤트부
			//값 초기화 구절
			trArray[j].childNodes[9].innerHTML = trArray[j].childNodes[7].childNodes[2].value * parseInt(trArray[j].childNodes[5].childNodes[2].innerHTML) ;
			//이벤트리스너
			trArray[j].childNodes[1].firstChild.addEventListener('click', function(){
			if(trArray[j].childNodes[1].firstChild.checked){
				sum += parseInt(trArray[j].childNodes[9].innerHTML);
				sumtext.innerHTML = sum;
				undisableFunction(delete_btn);
				undisableFunction(order_btn);
				let judge_sum = 0;
					for(let j=0; j<trArray.length; j++){
						judge_sum+= parseInt(trArray[j].childNodes[9].innerHTML);
					}
				if(sum===judge_sum){
					allCheckbox.checked = true;
				}
				
			}else{
				sum -= parseInt(trArray[j].childNodes[9].innerHTML);
				sumtext.innerHTML = sum;
				if(sum==0)
					allCheckbox.checked = false;
			}
			
			zeroCheck();
		});
			
		//7번째 tr get
			
	
		//버튼이벤트
		down_btn.addEventListener('click', function(){
			if(parseInt(qty_input.value)>1){
				let innerData = parseInt(qty_input.value)-1;
				qty_input.value = innerData;
				total_cash.innerHTML = innerData * product_cash;
				if(trArray[j].childNodes[1].firstChild.checked){
					sumtext.innerHTML = parseInt(sumtext.innerHTML) - product_cash;
					sum -= product_cash;
				}
			zeroCheck();
			}
		});
		
		
		up_btn.addEventListener('click', function(){
			if(parseInt(qty_input.value)<99){
			let innerData = parseInt(qty_input.value)+1;
			qty_input.value = innerData;
			total_cash.innerHTML = innerData * product_cash;
			if(trArray[j].childNodes[1].firstChild.checked){
				sumtext.innerHTML = parseInt(sumtext.innerHTML) + product_cash;
				sum += product_cash;
			}
				zeroCheck();
			}
		});
	}

	//전체 선택일때
	allCheckbox.addEventListener('change', function(){
	if(allCheckbox.checked){
		undisableFunction(delete_btn);
		undisableFunction(order_btn);
		sum = 0;
		for(let i = 0; i<trArray.length; i++){
			trArray[i].childNodes[1].firstChild.checked = true;
			sum += parseInt(trArray[i].childNodes[9].innerHTML);
			sumtext.innerHTML = sum;
		}
		
	}else{
		disableFunction(delete_btn);
		disableFunction(order_btn);
		for(let i = 0; i<trArray.length; i++){
			trArray[i].childNodes[1].firstChild.checked = false;
		}
		sum = 0;
		sumtext.innerHTML = 0;
	}
});	// 전체 체크박스
	
  function confirmDel(){
		if(confirm("선택상품을 삭제하시겠습니까?")==true){
			document.frm.action = "cartDelProc.jsp";
			document.frm.submit();
		}else{ //취소
			return;
		}
	}

	function disableFunction(element) {
		element.disabled = true;
		
		}

	function undisableFunction(element) {
			element.disabled = false;
	}
	
	function zeroCheck(){
		const total_cash_value = parseInt(document.querySelector('#sumtext').innerHTML);
		if(total_cash_value===0){
			for(let i=0; i<cart_rows.length; i++){
			    cart_rows[i].childNodes[1].firstChild.checked = false;
				disableFunction(delete_btn);
				disableFunction(order_btn);
			}
		}
	}
	
	
	//주문삭제
	delete_btn.addEventListener('click', confirmDel);
	
	//업데이트 
	function update_qty(){
		let p_code = new Array();
		let c_qty = new Array();
		for(let i=0; i<trArray.length; i++){
			p_code.push(trArray[i].childNodes[1].childNodes[0].value);
			c_qty.push(trArray[i].childNodes[7].childNodes[2].value);
		}
  	  //페이지 로딩 이벤트
  	    $.ajax({
  	        type: 'POST',                   //post or get
  	        url:ctx+'/order/qtychange',   //servlet mapping addr
  	        data: {
  	        	p_code : p_code,
  	        	c_qty : c_qty,
  	        	id : id
  	            },                              //key value
  	        success : function(data) {
  	        	alert('업데이트 완료');
  			 }, error : function(){
  	            //에러경우
  	            console.log('에러');
  	        }
  	    })
	}
	
	//업데이트 
	function call_qty(){
		console.log(id);
  	  //페이지 로딩 이벤트
  	    $.ajax({
  	        type: 'POST',                   //post or get
  	        url:ctx+'/order/qtycall',   //servlet mapping addr
  	        data: {
  	        	id : id
  	            },                              //key value
  	        success : function(data) {
    	 	const result = [];
    	 	const resultParse = JSON.parse(data);
  	  		for(let i=0; i<trArray.length; i++){
  	  			trArray[i].childNodes[7].childNodes[2].value = parseInt(resultParse[i].c_qty);
  	  			trArray[i].childNodes[9].innerHTML = parseInt(trArray[i].childNodes[5].childNodes[2].innerHTML) * parseInt(resultParse[i].c_qty);
  	  		console.log(trArray[i].childNodes[5].childNodes[2].innerHTML);
  	  		}

  	  		$('#main_contents').css("opacity","1");
  	  		$('#loader').css("display","none");
  	         }, error : function(){
  	            //에러경우
  	            console.log('에러');
  	        }
  	    })
	}
	//주문페이지 이동 시
	function goOrder(){
		let p_code2 = new Array();
		let c_qty2 = new Array();
		for(let i=0; i<trArray.length; i++){
			p_code2.push(trArray[i].childNodes[1].childNodes[0].value);
			c_qty2.push(trArray[i].childNodes[7].childNodes[2].value);
		}
  	  //페이지 로딩 이벤트
  	    $.ajax({
  	        type: 'POST',                   //post or get
  	        url:ctx+'/order/goorder',   //servlet mapping addr
  	        data: {
  	        	p_code : p_code2,
  	        	c_qty : c_qty2,
  	        	id : id
  	            },                              //key value
  	        success : function(data) {
  	        	if(parseInt(data)===1){
  	        		const go_order_form = document.getElementById('go_order_form');
  	        		go_order_form.submit();
  	        	}else{
  	        		console.log("업데이트 실패");
  	        	}
  			 }, error : function(){
  	            //에러경우
  	            console.log('에러');
  	        }
  	    })
	}
	
}
init();