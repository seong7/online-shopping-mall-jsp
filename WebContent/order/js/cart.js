function init(){	

	const cart_rows = document.getElementById("cart_table").rows;
	const delete_btn = document.querySelector('#delete_product');
	const order_btn = document.querySelector('#order_product');
	const allCheckbox = cart_rows[0].childNodes[1].firstChild;
	const sumtext = document.querySelector('#sumtext');
	
	let trArray = [];
	let sum = 0;
	//tr Array�� tr �迭 �־���(ù�� ����)
	for(let i=0; i<cart_rows.length; i++){
	    if(i!==0)  {
	    	trArray.push(cart_rows[i]);
	    }
	    cart_rows[i].childNodes[1].firstChild.checked = false;
	}
    console.log('üũ�ڽ� ��ü ���� �Ϸ�');
    
	for(let j=0; j<trArray.length; j++){
		const tr7 = trArray[j].childNodes[7];
		const down_btn = tr7.childNodes[0];
		let qty_input = tr7.childNodes[2];
		const up_btn = tr7.childNodes[4];
		let product_cash = parseInt(trArray[j].childNodes[5].childNodes[2].innerHTML);
		let total_cash = trArray[j].childNodes[9];	
		
		//üũ�ڽ� �̺�Ʈ��
			//�� �ʱ�ȭ ����
			trArray[j].childNodes[9].innerHTML = trArray[j].childNodes[7].childNodes[2].value * parseInt(trArray[j].childNodes[5].childNodes[2].innerHTML) ;
			//�̺�Ʈ������
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
			
		//7��° tr get
			
	
		//��ư�̺�Ʈ
		down_btn.addEventListener('click', function(){
			let innerData = parseInt(qty_input.value)-1;
			qty_input.value = innerData;
			total_cash.innerHTML = innerData * product_cash;
			if(trArray[j].childNodes[1].firstChild.checked){
				sumtext.innerHTML = parseInt(sumtext.innerHTML) - product_cash;
				sum -= product_cash;
			}
			
			zeroCheck();
		});
		
		up_btn.addEventListener('click', function(){
			let innerData = parseInt(qty_input.value)+1;
			qty_input.value = innerData;
			total_cash.innerHTML = innerData * product_cash;
			if(trArray[j].childNodes[1].firstChild.checked){
				sumtext.innerHTML = parseInt(sumtext.innerHTML) + product_cash;
				sum += product_cash;
			}
			zeroCheck();
		});
	}

	//��ü �����϶�
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
});	// ��ü üũ�ڽ�

  function confirmDel(){
		if(confirm("���û�ǰ�� �����Ͻðڽ��ϱ�?")==true){
			document.frm.action = "cartDelProc.jsp";
			document.frm.submit();
		}else{ //���
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
}
init();