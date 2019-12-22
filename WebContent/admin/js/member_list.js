function init(){
    const member_search_btn =  document.getElementById('select_value');
    member_search_btn.addEventListener('keypress', function (e) {
        var key = e.which || e.keyCode;
        if (key === 13) { 
        	console.log("엔터");
        	ajaxEvent();
        }
    });
    function ajaxEvent(){
        let select_type = document.getElementById('select_type').value;
        let select_value = member_search_btn.value;
        
    	console.log('event in');
    	if(select_value){
    	    //member_ajax start
        	console.log('event in2');
    	    $.ajax({
    	        type: 'POST',                   //post or get
    	        url:ctx+'/member/memberlist',   //servlet mapping addr
    	        data: {select_type: select_type,
    	                select_value : select_value
    	            },                              //key value
    	        success : function(data) {
    	    		let result = [];
    	    		let resultParse = JSON.parse(data);
    	    		 console.log(resultParse);
    	    		let result_table = document.getElementById('result_table');
    	    		let row_length = resultParse.length;
    	    		
    	    		 $("#judgeRow").nextAll().remove();
    	    			for(let j =0; j<row_length; j++){
        	    		let aTagStr = "<a href=./member_view.jsp?id="+ resultParse[j].id +">";
    	    			aTagStr += resultParse[j].id;
    	    			aTagStr += "</a>";
    	    			
    	        		let row = result_table.insertRow(1);
    	    			row.insertCell(0).innerHTML = aTagStr;
    	    			row.insertCell(1).innerHTML = resultParse[j].name;
    	    			row.insertCell(2).innerHTML = resultParse[j].birthday;
    	    			row.insertCell(3).innerHTML = resultParse[j].joindate;
    	    			row.insertCell(4).innerHTML = resultParse[j].email;
    	    			row.insertCell(5).innerHTML = resultParse[j].contact;
    	    			row.insertCell(6).innerHTML = resultParse[j].address;
    				}
    			 }, error : function(){
    	            //에러경우
    	            console.log('에러');
    	        }
    	    })
    	}else{
        	console.log('event in3');
    		$.ajax({
    	        type: 'POST',                   //post or get
    	        url:ctx+'/member/allmember',   //servlet mapping addr
    	        data: {
//    	                	select_type: select_type,
//    	                        select_value : select_value
    	        },                              //key value
    	     success : function(data) {
    	 		const result = [];
    	 		const resultParse = JSON.parse(data);
    	 		 
    	 		const result_table = document.getElementById('result_table');
    	 		const row_length = resultParse.length;
    	 		
    	 		const rowno = result_table.rows.length;
    	 		console.log('row_length' + row_length);
    	 		 $("#judgeRow").nextAll().remove();
    	 			for(let j =0; j<row_length; j++){
    	                let row = result_table.insertRow(1);
    	    			let aTagStr2 = "<a href=./member_view.jsp?id="+ resultParse[j].id +">";
    	    			aTagStr2 += resultParse[j].id;
    	    			aTagStr2 += "</a>";
    	                row.insertCell(0).innerHTML = aTagStr2;
    	                row.insertCell(1).innerHTML = resultParse[j].name;
    	                row.insertCell(2).innerHTML = resultParse[j].birthday;
    	                row.insertCell(3).innerHTML = resultParse[j].joindate;
    	                row.insertCell(4).innerHTML = resultParse[j].email;
    	                row.insertCell(5).innerHTML = resultParse[j].contact;
    	                row.insertCell(6).innerHTML = resultParse[j].address;
    			    }
    		    }, error : function(){
    	            //에러경우
    	            console.log('에러');
    	        }
    	    })
    	}
    }

    member_search_btn.addEventListener('click', ajaxEvent);

	ajaxEvent();
}
init();