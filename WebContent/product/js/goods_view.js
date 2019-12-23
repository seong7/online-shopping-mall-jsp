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
     if(qtyValue>=100){
     	alert('99�� ������ �ֹ��� �����մϴ�.');
        quantity.value = 99;
        qtyValue = 99;
     }
     if(qtyValue<1){
         quantity.value = 1;
         qtyValue = 1;
      }
        total.innerHTML = numberFormat(priceValue * qtyValue);
}

total.innerHTML = numberFormat(firstData);
console.log('����');
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
		 if(qtyValue==100)
			 qtyValue=99;
		  quantity.value = qtyValue;
		getresult();
//		console.log('��');
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