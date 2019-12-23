const quantity = document.getElementById('quantity');
const price = document.querySelector('#price');
const total = document.getElementById('total');
const firstData = stringNumberToInt(price.innerHTML) * parseInt(quantity.value);
const down_btn = document.getElementById('button_down');
const up_btn = document.getElementById('button_up');

function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}

function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function getresult(){
	 let priceValue = stringNumberToInt(price.innerHTML);
	 let qtyValue = parseInt(quantity.value);
     if(qtyValue>=10){
     	alert('9개 까지만 주문이 가능합니다.');
        quantity.value = 9;
        qtyValue = 9;
     }
        total.innerHTML = numberFormat(priceValue * qtyValue);
}

total.innerHTML = numberFormat(firstData);
console.log('파일');
function goodsView_init(){
	down_btn.addEventListener('click', function(){
		 let qtyValue = parseInt(quantity.value);
		 if(qtyValue==1){
			  quantity.value = 1;
		 }else{
			 qtyValue -= 1;
			 quantity.value = qtyValue;
		}
		getresult();
	});
	
		up_btn.addEventListener('click', function(){
		let qtyValue = parseInt(quantity.value);
		 qtyValue += 1;
		 if(qtyValue==10)
			 qtyValue=9;
		  quantity.value = qtyValue;
		getresult();
		console.log('업');
	});
	
    quantity.addEventListener('change', function(){
    	getresult();
    });
    
    $("#quantity").keyup(function(event){
        let inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/gi,''));
    });
}
	
goodsView_init();