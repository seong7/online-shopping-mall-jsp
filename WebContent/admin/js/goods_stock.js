
	
function init(){
	const ctx = getContextPath();

	function getContextPath() {
		const hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	document.getElementById('stock_delete_btn').addEventListener('click',function(){
		
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
	     }, error : function(){
	            //에러경우
	            console.log('에러');
	        }
	    });
		
	})
	
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
const typebox = document.getElementById('search_type');
const stfrm_name = document.getElementById('stfrm_name');
const stfrm_code = document.getElementById('stfrm_code');
let type = document.getElementById('search_type').value;
const request2 = new XMLHttpRequest();
const ctx2 = getContextPath();
const flagdata = "flag";
let dtcontrol = null;
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