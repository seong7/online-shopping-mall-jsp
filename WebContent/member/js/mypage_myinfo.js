const myinfo_name = document.getElementById('myinfo_name');
const myinfo_pwd1 = document.getElementById('myinfo_pwd1');
const myinfo_pwd2 = document.getElementById('myinfo_pwd2');
const myinfo_birthday = document.getElementById('myinfo_birthday');
const myinfo_email = document.getElementById('myinfo_email');
const myinfo_contact = document.getElementById('myinfo_contact');
const myinfo_zipcode = document.getElementById('myinfo_zipcode');
const myinfo_addr = document.getElementById('myinfo_addr');
const myinfo_detail_addr = document.getElementById('myinfo_detail_addr');
const pwd_alert = document.getElementById('pwd_alert');
const zip_btn = document.getElementById('zip_btn');


function init(){
	//form 버튼 이벤트
	document.getElementById('adrress_submit').addEventListener('click', info_check);
	//pwd1 이벤트
	myinfo_pwd1.addEventListener('focusout', pwd_check);
	myinfo_pwd2.addEventListener('focusout', pwd_check);
	
	openDaumZipAddress();
	
	zip_btn.addEventListener('click', openDaumZipAddress);

	function pwd_check(){
		console.log('패스워드체크 인')
		//값이 둘다 입력되었을때 and focus out 시
		if(myinfo_pwd1.value && myinfo_pwd2.value){
			//값이 같을때
			if(myinfo_pwd1.value !== myinfo_pwd2.value){
				myinfo_pwd1.value = '';
				myinfo_pwd2.value = '';
				myinfo_pwd1.focus();
				pwd_alert.innerHTML = '비밀번호가 일치하지 않습니다.';
			}else{
				pwd_alert.innerHTML = '';
			}
		}
	}
	
	function openDaumZipAddress() {
	    // 우편번호 찾기 화면을 넣을 element를 지정
	    const element_wrap = document.getElementById("daumWrap3");

		element_wrap.style.position  = "absolute";
	    // wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
	    if($("#daumWrap3").css("display") == "none") {
	        new daum.Postcode({
	            oncomplete:function(data) {
	                $("#myinfo_zipcode").val(data.zonecode);
	                $("#myinfo_addr").val(data.address);
	                $("#myinfo_detail_addr").focus();
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
	        $("#daumWrap3").slideDown();
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
	    $("#daumWrap3").slideUp();
	}
	
	function info_check(){
	    if(myinfo_name.value){
	    	myinfo_form.submit();
	    }else{
	    	alert('이름을 입력해주세요.');
	    	myinfo_name.focus();
	    }	    
	}
}




init();