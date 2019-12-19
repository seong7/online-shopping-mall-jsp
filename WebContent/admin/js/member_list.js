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
    	    		let reulstParse = JSON.parse(data);
    	    		 console.log(reulstParse);
    	    		let result_table = document.getElementById('result_table');
    	    		let row_length = reulstParse.length;
    	    		
    	    		 $("#judgeRow").nextAll().remove();
    	    			for(let j =0; j<row_length; j++){
    	        		let row = result_table.insertRow(1);
    	    			row.insertCell(0).innerHTML = reulstParse[j].id;
    	    			row.insertCell(1).innerHTML = reulstParse[j].name;
    	    			row.insertCell(2).innerHTML = reulstParse[j].birthday;
    	    			row.insertCell(3).innerHTML = reulstParse[j].joindate;
    	    			row.insertCell(4).innerHTML = reulstParse[j].email;
    	    			row.insertCell(5).innerHTML = reulstParse[j].contact;
    	    			row.insertCell(6).innerHTML = reulstParse[j].address;
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
    	 		const reulstParse = JSON.parse(data);
    	 		 
    	 		const result_table = document.getElementById('result_table');
    	 		const row_length = reulstParse.length;
    	 		
    	 		const rowno = result_table.rows.length;
    	 		console.log('row_length' + row_length);
    	 		 $("#judgeRow").nextAll().remove();
    	 			for(let j =0; j<row_length; j++){
    	                let row = result_table.insertRow(1);
    	                row.insertCell(0).innerHTML = reulstParse[j].id;
    	                row.insertCell(1).innerHTML = reulstParse[j].name;
    	                row.insertCell(2).innerHTML = reulstParse[j].birthday;
    	                row.insertCell(3).innerHTML = reulstParse[j].joindate;
    	                row.insertCell(4).innerHTML = reulstParse[j].email;
    	                row.insertCell(5).innerHTML = reulstParse[j].contact;
    	                row.insertCell(6).innerHTML = reulstParse[j].address;
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