
const request = new XMLHttpRequest();
const ctx = getContextPath();

function getContextPath() {
	const hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
console.log(ctx+"는 컨테스트 패스");
const login_submit_btn  = document.querySelector('#login_submit_btn');

const login_id_input  = document.querySelector('#login_id_input');
const signup_pwd = document.querySelector('#signup_pwd');
const signup_pwd_check = document.querySelector('#signup_pwd_check');
const signup_name = document.querySelector('#signup_name');
const signup_birth = document.querySelector('#signup_birth');
const signup_email = document.querySelector('#signup_email');
const signup_phone = document.querySelector('#signup_phone');
const signup_addr = document.querySelector('#signup_addr');
const address_section_btn = document.querySelector('#address_section_btn');
const address_section_zipcode = document.querySelector('#address_section_zipcode');
const signup_addr_detail = document.querySelector('#signup_addr_detail');
let sign_up_id_flag = 0;
let sign_up_pwd_flag = 0;
let sign_up_addr_flag = 0;
let sign_up_email_flag = 0;
let sign_up_name_flag  = 0;
let sign_up_birth_flag  = 0;
let sign_up_phone_flag  = 0;
let sign_up_detail_flag  = 0;
let regist_flag = 0;

function logout_onclick(){
	const logout_form =  document.querySelector('#logout_form');
	logout_form.submit();
}
function init(){
	openDaumZipAddress();
	 $("#signup_addr").val('');
	 $("#address_section_zipcode").val('');
	 $("#signup_addr_detail").val('');

    //search ajax
    searchInput();
    inputTransition();
    let modaltrigger = false;
    const userCheckBox = document.querySelector('#userPopup');
    const modalWindow = document.getElementById('modalDiv');
    const modalInnerFrame = document.getElementById('modalInnerFrame');

    const modal_elements_wrapper = document.getElementById('modal_elements_wrapper');
    const login_form = document.getElementById('login_form');
    

     /** 모달창 열림 닫힘 기능 **/
//    const session_id = "<%=id%>";

    userCheckBox.addEventListener('change', function(){
        modalInnerFrame.style.width = "0px";
        modalInnerFrame.style.height = "0px";
        if(!modaltrigger){

            modaltrigger = true;
            modalWindow.style.display = "block";
            modalWindow.style.opacity = "1";
            setTimeout(function(){
                modalInnerFrame.style.width = "400px";
                modalInnerFrame.style.height = "400px";
            }, 80);

            setTimeout(function(){
                modal_elements_wrapper.style.opacity="1";
                modal_elements_wrapper.style.transition="opacity 0.3s";
            }, 500);
            
            }
        else{
            modaltrigger = false;
            
            modalWindow.style.opacity = "0";
            modal_elements_wrapper.style.opacity="0";
            modalWindow.style.transition = "opacity 0.3s";
            setTimeout(function(){
                modalWindow.style.display = "none";
            }, 400);

            modalInnerFrame.style.width = "0px";
            modalInnerFrame.style.height = "0px";
            
            setTimeout(function(){
                login_signup('login');
            }, 600);
        }
    });
};


const login_form = document.getElementById("login_form");
const signup_form = document.getElementById("signup_form");
const login_btn_label = document.getElementById("login_btn_label");
const signup_btn_label = document.getElementById("signup_btn_label");

function login_signup(id){
    if(id=="login"){
        modalInnerFrame.style.width = "400px";
        modalInnerFrame.style.height = "400px";
        $('#login_btn_label').css('font-size', '19pt');
        $('#signup_btn_label').css('font-size', '16pt');

        signup_form.style.display="none";
        signup_btn_label.style.color="#FB9832";
        signup_form.style.opacity="0";
        
        login_form.style.display="flex";
        login_btn_label.style.color="#FB9832";
        setTimeout(function(){
            login_form.style.opacity="1";
            login_form.style.transition="opacity 0.3s";
        }, 300);
        
    }else{
        modalInnerFrame.style.width = "500px";
        modalInnerFrame.style.height = "800px";
        $('#login_btn_label').css('font-size', '16pt');
        $('#signup_btn_label').css('font-size', '19pt');
        login_btn_label.style.color="#FB9832";
        login_form.style.display="none";
        login_form.style.opacity="0";
        
        setTimeout(function(){
            signup_form.style.opacity="1";
            signup_form.style.transition="opacity 0.3s";
        }, 300);
        
        signup_form.style.display="flex";
        signup_btn_label.style.color="#FB9832";
        
        //input zero check
        function inputEmptyCheck(event){
        const inputTarget = event.target;
        	if(!inputTarget.value){
        		inputTarget.classList.remove('default_placeholder_red');
        		inputTarget.style.borderBottom = "solid 1px #FB9832 "
        		inputTarget.style.boxShadow = "0 4px 1px -3px #FB9832";
        	}
        }
        
        //target bottom green
        function inputBottomGreen(event){
            const inputTarget = event.target;
            	if(inputTarget.value){
            		inputTarget.style.borderBottom = "solid 1px green "
            		inputTarget.style.boxShadow = "0 4px 1px -3px green";
            	}
            }
        signup_pwd.addEventListener('keyup', inputEmptyCheck);
		signup_pwd_check.addEventListener('keyup', inputEmptyCheck);
        signup_name.addEventListener('keyup', inputEmptyCheck);
        signup_birth.addEventListener('keyup', inputEmptyCheck);
        signup_email.addEventListener('keyup', inputEmptyCheck);
        signup_phone.addEventListener('keyup', inputEmptyCheck);
        signup_addr.addEventListener('keyup', inputEmptyCheck);
        signup_addr_detail.addEventListener('keyup', inputEmptyCheck);
        //우편번호, 주소
        if(regist_flag= 0){
		$('#signup_addr').css('border-bottom', 'solid 1px red');
		$('#signup_addr').css('box-shadow', '0 4px 1px -3px red');
		signup_addr.classList.add('default_placeholder_red');
		
		$('#address_section_zipcode').css('border-bottom', 'solid 1px red');
		$('#address_section_zipcode').css('box-shadow', '0 4px 1px -3px red');
		address_section_zipcode.classList.add('default_placeholder_red');
        }
        
		signup_pwd_check.addEventListener('focusout', function(){
            if(signup_pwd.value){
	            if(signup_pwd.value === signup_pwd_check.value){
					$('#signup_pwd').css('border-bottom', 'solid 1px green');
					$('#signup_pwd').css('box-shadow', '0 4px 1px -3px green');
					$('#signup_pwd_check').css('border-bottom', 'solid 1px green');
					$('#signup_pwd_check').css('box-shadow', '0 4px 1px -3px green');

					sign_up_pwd_flag = 1;

	            }
	            else{
	            	signup_pwd.value = '';
	            	signup_pwd.classList.add('default_placeholder_red');
					$('#signup_pwd').css('border-bottom', 'solid 1px red');
					$('#signup_pwd').css('box-shadow', '0 4px 1px -3px red');
	            	signup_pwd_check.placeholder = "비밀번호가 일치하지 않습니다.";
	            	signup_pwd_check.classList.add('default_placeholder_red');
	            	signup_pwd_check.value = '';
					$('#signup_pwd_check').css('border-bottom', 'solid 1px red');
					$('#signup_pwd_check').css('box-shadow', '0 4px 1px -3px red');
					$('#signup_pwd').focus();

					sign_up_pwd_flag = 0;

	            }
            }
            else{
            	console.log('empty here');
            }
        });
	
		//이메일 유효성 검사
		function isValidEmail(email) {
			  var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    return (email != '' && email != 'undefined' && regex.test(email));
		}
		//null 체크

		function isNull(input) {
		    if (input.value == null || input.value == "") {
		        return true;
		    }
		    return false;
		}
		function isValidFormat(input,format) {
		    if (input.value.search(format) != -1) {
		        return true; //올바른 포맷 형식
		    }
		    return false;
		}
		
		signup_name.addEventListener('focusout', function(){
			if(!($('#signup_name').val())){
				signup_name.classList.add('default_placeholder_red');
				sign_up_name_flag  = 0;
			}
			else{
				signup_name.style.borderBottom = "solid 1px green "
				signup_name.style.boxShadow = "0 4px 1px -3px green";
				sign_up_name_flag = 1;
			}
		});
		
		signup_birth.addEventListener('focusout', function(){
			const dayRegExp = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
			if(!dayRegExp.test($('#signup_birth').val())){
				signup_birth.classList.add('default_placeholder_red');
				signup_birth.style.borderBottom = "solid 1px red "
				signup_birth.style.boxShadow = "0 4px 1px -3px red";
				signup_birth.placeholder = "생년월일을 정확히 입력해주세요. (YYYY-MM-DD)";
				signup_birth.value = '';
				sign_up_birth_flag  = 0;
			}
			else{
				signup_birth.style.borderBottom = "solid 1px green "
				signup_birth.style.boxShadow = "0 4px 1px -3px green";
				sign_up_birth_flag = 1;
			}
		});
		
		signup_email.addEventListener('focusout', function(){
			if(!isValidEmail($('#signup_email').val())){
				signup_email.placeholder = "이메일 형식으로 입력해주세요.";
				signup_email.value = '';
				signup_email.classList.add('default_placeholder_red');
				signup_email.style.borderBottom = "solid 1px red "
				signup_email.style.boxShadow = "0 4px 1px -3px red";
				sign_up_email_flag = 0;
			}
			else{
				signup_email.style.borderBottom = "solid 1px green "
				signup_email.style.boxShadow = "0 4px 1px -3px green";
				sign_up_email_flag = 1;
			}
		});	
		signup_phone.addEventListener('focusout', function(){
			const regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			if(!regExp.test($('#signup_phone').val())){
				signup_phone.placeholder = "정확한 형식으로 입력해주세요.";
            	signup_phone.value = '';
            	signup_phone.classList.add('default_placeholder_red');
            	signup_phone.style.borderBottom = "solid 1px red "
            	signup_phone.style.boxShadow = "0 4px 1px -3px red";
				sign_up_phone_flag  = 0;
			}
			else{
				signup_phone.style.borderBottom = "solid 1px green "
				signup_phone.style.boxShadow = "0 4px 1px -3px green";
				sign_up_phone_flag = 1;
			}
		});
		

		signup_addr_detail.addEventListener('focusout', function(){
			if(!($('#signup_addr_detail').val())){
				signup_addr_detail.classList.add('default_placeholder_red');
				signup_addr_detail.style.borderBottom = "solid 1px red "
				signup_addr_detail.style.boxShadow = "0 4px 1px -3px red";
				sign_up_detail_flag  = 0;
			}
			else{
				signup_addr_detail.style.borderBottom = "solid 1px green "
				signup_addr_detail.style.boxShadow = "0 4px 1px -3px green";
				sign_up_detail_flag = 1;
			}
		});
    }	
};


/** 검색 Ajax 부분 **/
function searchInput(){
    $("#search_input").autocomplete({ 
            source : function( request, response ) {
                 const autoValues = $.ajax({
                     url: ctx+"/search.jsp", 
                     dataType: "json",               
                     data: {
                          searchValue: encodeURIComponent(request.term)
                         },
                          success: function(result) { 
                                response( 
                                   $.map( result, function(item) {
                                        return { 
                                            label: item.data,
                                            value: item.data 
                                        }
                                   })
                                );
                          }
                 });
        },  
        minLength: 1, 
        select: function( event, ui ) {
        	
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
    
    //아이디 중복체크부
	const duplicate_btn = document.querySelector('#id_section_btn');
	id_section_btn.addEventListener('click', function(){
	const userID = $('#id_section_input').val();
	if(!userID){
		alert("아이디를 입력해주세요");
		sign_up_id_flag = 0;
	}
	else{
		console.log(userID);
		$.ajax({
			type: 'POST',
			url:ctx+'/member/idcheck',
			data: {userID: userID},
//	         아이디 중복체크부
			success : function(result) {
				if(result == 0){
					$('#id_section_input').css('border-bottom', 'solid 1px green');
					$('#id_section_input').css('box-shadow', '0 4px 1px -3px green');
					$('#id_section_btn').removeClass('top_modal_orange');
					$('#id_section_btn').removeClass('top_modal_red');
					$('#id_section_btn').addClass('top_modal_green');	
					document.getElementById('signup_pwd').focus();
					 sign_up_id_flag = 1;
	                
				}else{
			        const id_section_input = document.querySelector('#id_section_input');
					$('#id_section_input').css('border-bottom', 'solid 1px red');
					$('#id_section_input').css('box-shadow', '0 4px 1px -3px red');
					$('#id_section_btn').removeClass('top_modal_orange');
					$('#id_section_btn').removeClass('top_modal_green');
					$('#id_section_btn').addClass('top_modal_red');	
					id_section_input.placeholder = "아이디가 중복되었습니다.";
					id_section_input.classList.add('default_placeholder_red');
					id_section_input.value = '';
					 $('#id_section_input').focus();

					 sign_up_id_flag = 0;
				}
			}, error : function(){
				sign_up_id_flag = 0;
				
			}
		})
	}
	});
	//login ajax
	login_submit_btn.addEventListener('click', function(){
		let login_id = $('#login_id_input').val();
		let login_pwd = $('#login_pwd_input').val();
		$('#login_span').removeClass('box');
		$('#login_span').addClass('hidden');
		
		$.ajax({
			type: 'post',
			url:ctx+'/member/login',
			data: {
				login_id : login_id,
				login_pwd : login_pwd
			},
			dataType: 'json',
//	         로그인부
			success : function(result) {
				if(result == 1){
					$('#login_span').removeClass('hidden');
					$('#login_span').addClass('box');
					$('#login_span').text('로그인 성공!');
					$('#login_submit_btn').css( 'font-weight' , 'bold' );
					$('#login_submit_btn').removeClass('top_modal_orange');
					$('#login_submit_btn').removeClass('top_modal_red');
					$('#login_submit_btn').addClass('top_modal_green');	
					$('#login_span').removeClass('top_modal_orange');
					$('#login_span').addClass('top_modal_green');					
					$('#login_span').attr("disabled","disabled");
					setTimeout(function(){
					   	 location.href='http://localhost/online-shopping-mall/index.jsp'
				     }, 500);
				}
			}, error : function(){
				$('#login_submit_btn').removeClass('hidden');
				$('#login_submit_btn').addClass('box');
				$('#login_submit_btn').text('로그인 실패');
				$('#login_submit_btn').css( 'font-weight' , 'bold' );
				$('#login_submit_btn').css("color", "white");
				$('#login_submit_btn').removeClass('top_modal_orange');
				$('#login_submit_btn').addClass('top_modal_red');
				$('#login_submit_btn').removeClass('top_modal_green');	
			}
		})	
	});
	
	//signup ajax

	signup_submit_btn.addEventListener('click', function(){
		$('#submit_span').removeClass('box');
		$('#submit_span').addClass('hidden');
		
		if(sign_up_id_flag == 0){
			alert("아이디를 입력해주세요.");
			console.log(sign_up_id_flag);
		}
		else if(sign_up_pwd_flag == 0){
			alert("비밀번호를 입력해주세요.");
		}
		else if(sign_up_name_flag == 0){
			alert("이름을 입력해주세요.");
		}
		else if(sign_up_birth_flag == 0){
			alert("생일을 입력해주세요.");
		}
		else if(sign_up_email_flag == 0){
			alert("이메일을 입력해주세요.");
		}
		else if(sign_up_phone_flag == 0){
			alert("휴대폰번호를 입력해주세요.");
		}
		else if(sign_up_addr_flag == 0 || sign_up_detail_flag == 0){
			alert("주소를 입력해주세요.");
		}
		else{
			let signup_section_inputValue = $('#id_section_input').val();
			let signup_pwdValue = $('#signup_pwd').val();
			let signup_pwd_checkValue = $('#signup_pwd_check').val();
			let signup_nameVal = $('#signup_name').val();
			let signup_birthValue =  $('#signup_birth').val();
			let signup_emailValue = $('#signup_email').val();
			let signup_phoneValue = $('#signup_phone').val();
			let signup_addrValue =  $('#signup_addr').val();
			let address_section_zipcodeValue = $('#address_section_zipcode').val();
			let signup_addr_detailValue =  $('#signup_addr_detail').val();
			
			
			//회원가입 이벤트 ajax
			$.ajax({
				type: 'post',
				url:ctx+'/member/signup',
				data: {
					signup_id_input : signup_section_inputValue,
					signup_pwd_check : signup_pwdValue,
					signup_name : signup_nameVal,
					signup_birth : signup_birthValue,
					signup_email : signup_emailValue,
					signup_phone : signup_phoneValue,
					address_section_zipcode : address_section_zipcodeValue,
					signup_addr : signup_addrValue,
					signup_addr_detail : signup_addr_detailValue
				},
				dataType: 'json',
//		         아이디 중복체크부
				success : function(result) {
					if(result == 1){
						$('#submit_span').removeClass('hidden');
						$('#submit_span').addClass('box');
						$('#submit_span').text('회원가입 완료!');
						$('#signup_submit_btn').removeClass('top_modal_orange');
						$('#signup_submit_btn').addClass('top_modal_green');	
						$('#signup_submit_btn').attr("disabled","disabled");
						regist_flag = 1;
					}else{
					$('#submit_span').addClass('box');
					$('#submit_span').text('실패하셨습니다.');
					$('#signup_submit_btn').removeClass('top_modal_orange');
					$('#signup_submit_btn').addClass('top_modal_red');	
					}
				}, error : function(){
					console.log('실패');
				}
			})	
		}
		});
}
function inputTransition(){
    const input = document.querySelector('#search_input');
    let searchIcon = document.querySelector('.fa-search');

    input.addEventListener('focus', function(){
        searchIcon.style.color = "#ff9f43";
    });
    input.addEventListener("focusout", function(){
        searchIcon.style.color = "#a4b0be";
    });
}

//다음 주소검색 연동
function openDaumZipAddress() {
    // 우편번호 찾기 화면을 넣을 element를 지정
    const element_wrap = document.getElementById("daumWrap");

	element_wrap.style.position  = "absolute";
    // wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
    if($("#daumWrap").css("display") == "none") {
        new daum.Postcode({
            oncomplete:function(data) {
                $("#address_section_zipcode").val(data.zonecode);
                $("#signup_addr").val(data.address);
                $("#signup_addr_detail").focus();
				$('#address_section_zipcode').css('border-bottom', 'solid 1px green');
				$('#address_section_zipcode').css('box-shadow', '0 4px 1px -3px green');
				$('#signup_addr').css('border-bottom', 'solid 1px green');
				$('#signup_addr').css('box-shadow', '0 4px 1px -3px green');
				sign_up_addr_flag = 1;
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
        $("#daumWrap").slideDown();
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
    $("#daumWrap").slideUp();

}

init();
