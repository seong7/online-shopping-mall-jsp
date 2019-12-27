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
    const addr_btn = document.getElementById('addr_btn');
    const member_inputs = document.querySelectorAll('.member_inputs');
    console.log('업데이트 완료');
    let update_btn_readonly_off = 0;
    let page_loading_flag = 0;	//페이지 로딩여부

	addr_btn.disabled = true; // 주소버튼 disabled 초기화 
    openDaumZipAddress();
    
    function ajaxEvent(){
    	if(!page_loading_flag){
    		console.log("ajax inn");
	    	  //페이지 로딩 이벤트
    		page_loading_flag = "1";
	    	    $.ajax({
	    	        type: 'POST',                   //post or get
	    	        url:ctx+'/member/memberdetail',   //servlet mapping addr
	    	        data: {member_id: member_id.value
	    	            },                              //key value
	    	        success : function(data) {
	    	        	console.log(data);
	    	    		let resultParse = JSON.parse(data);
	    	    		console.log(resultParse[0]);
	    	    		member_name.value = resultParse[0].name;
	    	    		member_birthday.value = resultParse[0].birthday;
	    	    		member_joindate.value = resultParse[0].joindate;
	    	    		member_contact.value = resultParse[0].contact;
	    	    		member_email.value = resultParse[0].email;
	    	    		member_point.value = resultParse[0].point;
	    	    		member_zipcode.value = resultParse[0].zipcode;
	    	    		member_address.value = resultParse[0].address;
	    	    		member_address_detail.value = resultParse[0].address_detail;

	    	    		resultParse.shift();
	    	    		console.log(resultParse);/*
	    	    		$('#order_table').DataTable({
	    	    			data: resultParse,
	    	    			columns : [
	    	    				{ data: 'index' },
	    	    		        { data: 'o_del_date' },
	    	    		        { data: 'o_index' },
	    	    		        { data: 'p_name' },
	    	    		        { data: 'o_total_amount' },
	    	    		        { data: 'o_total_amount' },
	    	    		        { data: 'return_state' }
	    	    			]
	    	    		});*/
	    			 }, error : function(){
	    	            //에러경우
	    	            console.log('에러');
	    	        }
	    	    })
	    	
    	}else{
    		console.log("안녕 ");
    	}
    }
    
    function update_member_detail(){
	    	  //페이지 로딩 이벤트
	    	    $.ajax({
	    	        type: 'POST',                   //post or get
	    	        url:ctx+'/member/memberdetailupdate',   //servlet mapping addr
	    	        data: {member_id: member_id.value,
	    	        	member_birthday : member_birthday.value,
	    	        	member_joindate : member_joindate.value,
	    	        	member_contact : member_contact.value,
	    	        	member_email : member_email.value,
	    	        	member_zipcode : member_zipcode.value,
	    	        	member_address : member_address.value,
	    	        	member_address_detail : member_address_detail.value
	    	            },                              //key value
	    	        success : function(data) {
	    	        	alert('업데이트 완료');
	    	        	console.log("success구문");
	    			 }, error : function(){
	    	            //에러경우
	    	            console.log('에러');
	    	        }
	    	    })
    }
    member_delete_btn.addEventListener('click', function(){
    	//회원정보삭제구문
    	const deleteConfirm = confirm('회원정보를 삭제하시겠습니까?');
    	if(deleteConfirm){
    	    $.ajax({
    	        type: 'POST',                   //post or get
    	        url:ctx+'/member/deletemember',   //servlet mapping addr
    	        data: {
    	        	member_id: member_id.value,
    	            },                              //key value
    	        success : function(data) {
    	        	if(data==1){
        	        	alert('회원정보가 삭제되었습니다.');
        	        	location.href="http://localhost/online-shopping-mall/admin/member_list.jsp";
    	        	}else{
    	        		alert('실패');
    	        	}
    			 }, error : function(){
    	            //에러경우
    	            console.log('에러');
    	        }
    	    })
    	}
    	else{
//    		alert('삭제가 취소되었습니다.');
    	}
    })
    member_update_btn.addEventListener('click', function(){
    	if(update_btn_readonly_off===1){
    		update_btn_readonly_off = 0;	//수정완료(데이터 전송)
    		member_update_btn.value = "수정하기";
			addr_btn.disabled = true;
    		member_update_btn.style.backgroundColor = "white";
    		member_update_btn.style.color = "#FB9832";
    		member_inputs.forEach(function(items){
    		items.readOnly = true;
    		items.classList.add('disabled');
    		});
    		offDaumZipAddress();
    		update_member_detail();
    	}
    	else{
    		update_btn_readonly_off = 1;	//수정상태
    		member_update_btn.value = "수정완료";
			addr_btn.disabled = false;
    		console.log('수정시작!');
    		member_update_btn.style.backgroundColor = "#FB9832";
    		member_update_btn.style.color = "white";
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
function openDaumZipAddress() {
    // 우편번호 찾기 화면을 넣을 element를 지정
    const element_wrap = document.getElementById("daumWrap2");

	element_wrap.style.position  = "absolute";
    // wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
    if($("#daumWrap2").css("display") == "none") {
        new daum.Postcode({
            oncomplete:function(data) {
                $("#member_zipcode").val(data.zonecode);
                $("#member_address").val(data.address);
                $("#member_address_detail").focus();
            }
            // 사용자가 값을 주소를 선택해서 레이어를 닫을 경우
            // 다음 주소록 레이어를 완전히 종료 시킨다.
            , onclose:function(state) {
                if(state === "COMPLETE_CLOSE") {
                    // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
                    offDaumZipAddress(function() {
                        element_wrap.style.display = "none";
                    });
                }
            }
        }).embed(element_wrap);

        // 슬라이드 다운 기능을 이용해 레이어 창을 오픈한다.
        $("#daumWrap2").slideDown();
    }
    
    // warp 레이어가 open된 상태라면 다음 우편번호 레이어를 off 상태로 변경한다.
    else {
        // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
        offDaumZipAddress(function() {
            element_wrap.style.display = "none";
            return false;
        });
    }
}

function offDaumZipAddress() {
	// 슬라이드 업 기능을 이용해 레이어 창을 닫는다.
    $("#daumWrap2").slideUp();
}

init();