function init(){
	
}
const ctx2 = getContextPath();
let flagdata = 1;
let dtcontrol = null;

function ajaxEvent(){
	console.log("ajax inn");
	  //페이지 로딩 이벤트
	    $.ajax({
	        type: 'POST',                   //post or get
            url: ctx2+"/admin/getip", 
	        data: {
	        	flag: flagdata
	            },                              //key value
	        success : function(data2) {
	        	console.log(data2);
	        	let data = JSON.parse(data2);
	        	const result_table = document.getElementById('connect_table');
        	  	let row_length = data.length;
        	  	
        	  	dtcontrol = $('#connect_table').DataTable( {
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
          	  	        { data: 'id' },
          	  	        { data: 'time' },
          	  	        { data: 'ip' }
        	  	    ]
        	  	});
			 }, error : function(){
	            //에러경우
	            console.log('에러');
	        }
	    })
}

function getContextPath() {
	const hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
init();
$(document).ready(function () {
	ajaxEvent();
});