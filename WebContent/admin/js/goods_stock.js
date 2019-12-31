
const modalDiv2 = document.getElementById('modalDiv2');
const stock_update_btn = document.getElementById('stock_update_btn');
const typebox = document.getElementById('search_type');
const stfrm_name = document.getElementById('stfrm_name');
const stfrm_code = document.getElementById('stfrm_code');
const modal_code = document.getElementById('modal_code');
const modal_name = document.getElementById('modal_name');
const modal_enter = document.getElementById('modal_enter');
const modal_ava = document.getElementById('modal_ava');
const modal_waste = document.getElementById('modal_waste');
const modal_date = document.getElementById('modal_date');
const modal_update_btn = document.getElementById('modal_update_btn');
const modal_close_btn = document.getElementById('modal_close_btn');
const add_stock_wrapper = document.getElementById('add_stock_wrapper');
const display_addstock = document.getElementById('display_addstock');
let display_flag = 0;
let type = document.getElementById('search_type').value;
const request2 = new XMLHttpRequest();
const ctx2 = getContextPath();
const flagdata = "flag";
let dtcontrol = null;
display_addstock.addEventListener('click',function(){
	if(display_flag===0){
		add_stock_wrapper.style.display = "block";
		display_flag = 1;
		display_addstock.innerHTML = "입고 숨기기";
		display_addstock.value ="입고 숨기기";
	}else{
		add_stock_wrapper.style.display = "none";
		display_flag = 0;
		display_addstock.innerHTML ="입고등록";
		display_addstock.value ="입고등록";
	}
});

document.getElementById('selected_data').value = '[]';
function init(){
	const ctx = getContextPath();

	function getContextPath() {
		const hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	//업데이트 ajax
	function modal_update_event(){
		console.log('제품 수량 업데이트 시작2');
		const modal_update_code = modal_code.value;
		const modal_update_name = modal_name.value;
		const modal_update_enter = modal_enter.value;
		const modal_update_ava = modal_ava.value;
		const modal_update_waste = modal_waste.value;
		const modal_update_date = modal_date.value; 
		
		console.log(modal_update_code);
		console.log(modal_update_enter);
		console.log(modal_update_ava);
		console.log(modal_update_waste);
		console.log(modal_update_date);

		$.ajax({
	        type: 'POST',                   //post or get
	        url:ctx+'/product/stockmodalupdate',   //servlet mapping addr
	        data: {
	        	code : modal_update_code,
	        	enter : modal_update_enter,
	        	ava : modal_update_ava,
	        	waste : modal_update_waste,
	        	date : modal_update_date
	        },                              //key value
	     success : function(data) {
	    	 console.log(data);
	    	 console.log('업데이트 완료');
			location.reload(true); 
	     }, error : function(){
	            //에러경우
	            console.log('에러');
	        }
	    });
	}
	
	$('#product_search').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
	
	$('#waste_qty_include').on('change',function(){
		if($(this).is(':checked')){
			$.fn.dataTable.ext.search.push(
					function(settings, data, dataIndex){
						console.log("이벤트 인");
						console.log(dataIndex);
						return data[6]>0;
					}
				);
		}else{
			$.fn.dataTable.ext.search.pop();
		}
		dtcontrol.draw();
	});
	modal_update_btn.addEventListener('click', function(){
		console.log('제품 수량 업데이트 시작');
		modal_update_event();
	});
	
	modal_close_btn.addEventListener('click', function(){
		modalDiv2.style.display = "none";
	});
	
	window.onclick = function(e){
		if(e.target==modalDiv2){
			modalDiv2.style.display = "none";
		}
	}
	function waste_function(){
		let hidden_select_data = document.getElementById('selected_data').value;
		let hidden_select_array = JSON.parse(hidden_select_data);
		//삭제하기 위해 필요한 데이터들
		let inner_code = new Array;
		let inner_enter = new Array;
		let inner_date = new Array; 
		//여기까지
		
		for(let i =0; i<hidden_select_array.length;i++){
			inner_code.push(hidden_select_array[i].code);
			inner_enter.push(hidden_select_array[i].enter);
			inner_date.push(hidden_select_array[i].date);			
		}
		console.log("코드:" + inner_code);
		console.log("입고수량:" + inner_enter);
		console.log("입고날자:" + inner_date);
		
		$.ajax({
	        type: 'POST',                   //post or get
	        url:ctx+'/product/stockwaste',   //servlet mapping addr
	        data: {
	        	code : inner_code,
	        	enter : inner_enter,
	        	date : inner_date
	        },                              //key value
	     success : function(data) {
	    	 console.log(data);
			location.reload(true); 
	     }, error : function(){
	            //에러경우
	            console.log('에러');
	        }
	    });
	}
	//제품 폐기
	document.getElementById('stock_delete_btn').addEventListener('click',function(){
	    const con_test = confirm("폐기처리 하시겠습니까?");
	    if(con_test == true){
			waste_function();
	    }
	    else if(con_test == false){
	    	console.log("취소하셨습니다.");
	    }
	});
	
	//제품 수정
	stock_update_btn.addEventListener('click',function(){
		let hidden_select_data = document.getElementById('selected_data').value;
		let hidden_select_array = JSON.parse(hidden_select_data);
		console.log(hidden_select_array);
		if(hidden_select_array.length===1){
			modalDiv2.style.display = "block";
			modal_code.value = (hidden_select_array[0].code);
			modal_name.value = (hidden_select_array[0].name);
			modal_enter.value = (hidden_select_array[0].enter);
			modal_ava.value = (hidden_select_array[0].ava);
			modal_waste.value = (hidden_select_array[0].waste);
			modal_date.value = (hidden_select_array[0].date);
		}else{
			alert('제품 한개를 선택해주세요');
		}
	});
	console.log("펑션2");
	function searchInput(){
	    $("#product_search").autocomplete({ 
	            source : function( request, response ) {
	            	type = document.getElementById('search_type').value;
	                 const autoValues = $.ajax({
	                     url: ctx2+"/goods_stock_search.jsp", 
	                     dataType: "json",               
	                     data: {
	                          searchValue: encodeURIComponent(request.term),
	                          searchType : type
	                         },
	                          success: function(result) {
	                        	  	console.log(result);
	                                response( 
	                                   $.map( result, function(item) {
	                                        return { 
	                                            label: item.name,
	                                            value: item.name,
	                                            code: item.code
	                                        }
	                                   })
	                                );
	                          }
	                 });
	        },  
	        minLength: 1, 
	        select: function( event, ui ) {
	        	typebox.selectedIndex = 1;
	        	console.log("셀렉트 이벤트 인");
	        	stfrm_name.value = ui.item.value;
	        	stfrm_code.value = ui.item.code;
	        } 
	   }).focus(function(){            
	       $(this).data("uiAutocomplete").search($(this).val());
	   });
	    
	    $.ui.autocomplete.prototype._renderItem = function (ul, item) {
	        item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
	        return $("<li></li>")
	                .data("item.autocomplete", item)
	                .append("<a>" + item.label + "</a>")
	                .appendTo(ul);
	    };
	}
	

	searchInput();
	ajaxEvent();
	
	
}
function getContextPath() {
	const hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
function ajaxEvent(){
		console.log("ajax inn");
    	  //페이지 로딩 이벤트
    	    $.ajax({
    	        type: 'POST',                   //post or get
                url: ctx2+"/product/getproductlist", 
    	        data: {
    	        	flag: flagdata
    	            },                              //key value
    	        success : function(data2) {
    	        	console.log(data2);
    	        	let data = JSON.parse(data2);
    	        	const result_table = document.getElementById('stock_table');
            	  	let row_length = data.length;
            	  	
            	  	dtcontrol = $('#stock_table').DataTable( {
            	  	    data: data,
            	  	    select: true,
            	  	    buttons : [
            	  	      {
            	                text: 'Select all',
            	                action: function () {
            	                    table.rows().select();
            	                }
            	            },
            	            {
            	                text: 'Select none',
            	                action: function () {
            	                    table.rows().deselect();
            	                }
            	            }
            	  	    ],
            	  	    columns: [
            	  	        { data: 'index' },
            	  	        { data: 'code' },
            	  	        { data: 'name' },
            	  	        { data: 'enter' },
            	  	        { data: 'ava' },
            	  	        { data: 'waste' },
            	  	        { data: 'dday' },
            	  	        { data: 'date' }
            	  	    ]
            	  	});
            	  	
            	  	dtcontrol
            	  	 .on( 'select', function ( e, dt, type, indexes ) {
            	            let rowData = dtcontrol.rows( indexes ).data().toArray();
            	            document.getElementById('selected_data').value = JSON.stringify( rowData );
            	        } )
    			 }, error : function(){
    	            //에러경우
    	            console.log('에러');
    	        }
    	    })
}



init();