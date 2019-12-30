const quantity = document.getElementById('quantity');
const price = document.querySelector('#price');
const total = document.getElementById('total');
const down_btn = document.getElementById('button_down');
const up_btn = document.getElementById('button_up');
const cartBtn = document.getElementById('cartBtn');
const submit_btn = document.getElementById('submit_btn');
let maxqty = quantity.max;



function goodsView_init() {
	const firstData = stringNumberToInt(price.innerHTML) * parseInt(quantity.value);
	console.log(maxqty);
	total.innerHTML = numberFormat(firstData);

	function stringNumberToInt(stringNumber) {
		return parseInt(stringNumber.replace(/,/g, ''));
	}
	
	function down_evnet(){
		let qtyValue = parseInt(quantity.value);
		if (qtyValue == 1) {
			quantity.value = 1;
		} else {
			qtyValue -= 1;
			quantity.value = qtyValue;
		}
		getresult();
	}
	function up_event(){
		let qtyValue = parseInt(quantity.value);
		qtyValue += 1;
		if (qtyValue == 100)
			qtyValue = 99;
		quantity.value = qtyValue;
		getresult();
	}
	function getresult() {
		let priceValue = stringNumberToInt(price.innerHTML);
		let qtyValue = parseInt(quantity.value);
		if (qtyValue > maxqty) {
			alert(maxqty + '개 까지만 주문이 가능합니다.');
			quantity.value = maxqty;
			qtyValue = maxqty;
		}
		if (qtyValue < 1) {
			quantity.value = 1;
			qtyValue = 1;
		}
		total.innerHTML = numberFormat(priceValue * qtyValue);
	}
	

	function numberFormat(inputNumber) {
		return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	if(!(maxqty < 1)){
		down_btn.addEventListener('click', down_evnet);
		up_btn.addEventListener('click', up_event);
	}
	quantity.addEventListener('change', function() {
		getresult();
	});

	$("#quantity").keyup(function(event) {
		let inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^0-9]/gi, ''));
	});
	
	if(maxqty < 1){
		cartBtn.style.opacity= "0";
		cartBtn.style.cursor ="inherit";
		submit_btn.value = "매진";
		submit_btn.style.backgroundColor = "#f03939";
		submit_btn.style.border = "3px solid #ee561b82";
		submit_btn.classList.add('disable_press_effect');
		cartBtn.disabled = true;
		submit_btn.disabled = true;
		quantity.disabled = true;
		quantity.value = 0;
		quantity.innerHTML = 0;
		total.innerHTML = 0;
	}
}
window.onload = goodsView_init();