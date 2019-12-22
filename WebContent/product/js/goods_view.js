

function goodsView_init(){
    // const quantity = document.querySelector('#quantity');
    const quantity = document.getElementById('quantity');
    // const price = document.getElementById('price');
    const price = document.querySelector('#price');
    const total = document.getElementById('total');

    let priceValue = price.Value;
    let qtyValue = quantity.value;
    
    total.value = priceValue * qtyValue;

    quantity.addEventListener('change', function(){
        console.log(priceValue*qtyValue);
        total.value = priceValue * qtyValue;
    })
    
}

goodsView_init();