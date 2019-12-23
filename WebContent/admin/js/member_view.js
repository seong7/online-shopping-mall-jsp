function init(){
    const member_update_btn =  document.getElementById('update');
    const member_delete_btn =  document.getElementById('delete');
    const member_name =  document.getElementById('member_name');
    const member_id =  document.getElementById('member_id');
    const member_birthday =  document.getElementById('member_birthday');
    const member_joindate =  document.getElementById('member_joindate');
    const member_contact =  document.getElementById('member_contact');
    const member_email =  document.getElementById('member_email');
    const member_point =  document.getElementById('member_point');
    const member_zipcode =  document.getElementById('member_zipcode');
    const member_address =  document.getElementById('member_address');
    const member_address_detail =  document.getElementById('member_address_detail');
    const member_inputs = document.querySelectorAll('.member_inputs');
    
    let update_btn_readonly_off = 0;
    let page_loading_flag = 0;	//페이지 로딩여부
    
    member_delete_btn.style.backgroundColor = "#FF5F59";

    function ajaxEvent(){
    	if(!page_loading_flag){
    		console.log("ajax in");
	    	  //페이지 로딩 이벤트
    		console.log("asdfadsfadf");
    		page_loading_flag = "1";
	    	    $.ajax({
	    	        type: 'POST',                   //post or get
	    	        url:ctx+'/member/memberdetail',   //servlet mapping addr
	    	        data: {member_id: member_id.value
	    	            },                              //key value
	    	        success : function(data) {
	    	        	console.log(data);
	    	    		let resultParse = JSON.parse(data);
	    	    		console.log(resultParse);
	    	    		console.log(resultParse[0]);
	    	    		console.log(resultParse[1]);
	    	    		console.log(resultParse[2]);
	    	    		member_name.value = resultParse[0].name;
	    	    		member_birthday.value = resultParse[0].birthday;
	    	    		member_joindate.value = resultParse[0].joindate;
	    	    		member_contact.value = resultParse[0].contact;
	    	    		member_email.value = resultParse[0].email;
	    	    		member_point.value = resultParse[0].point;
	    	    		member_zipcode.value = resultParse[0].zipcode;
	    	    		member_address.value = resultParse[0].address;
	    	    		member_address_detail.value = resultParse[0].address_detail;
	    			 }, error : function(){
	    	            //에러경우
	    	            console.log('에러');
	    	        }
	    	    })
	    	
    	}else{
    		console.log("안녕 ");
    	}
    }

    member_update_btn.addEventListener('click', function(){
    	if(update_btn_readonly_off===1){
    		update_btn_readonly_off = 0;	//수정완료(데이터 전송)
    		member_update_btn.value = "수정";
    		member_update_btn.style.backgroundColor = "#fec084";
    		member_inputs.forEach(function(items){
    			items.readOnly = true;
    			items.classList.add('disabled');
    		});
    	}
    	else{
    		update_btn_readonly_off = 1;	//수정상태
    		member_update_btn.value = "수정완료";
    		member_update_btn.style.backgroundColor = "#EB6B1C";
    		member_inputs.forEach(function(items){
    			items.readOnly = false;
    			items.classList.remove('disabled');
    		});
    		
    	}
    });

	ajaxEvent();

	console.log("init complete");
	console.log(page_loading_flag);
}
init();