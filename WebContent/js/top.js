

const request = new XMLHttpRequest();

function init(){
	
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

    userCheckBox.addEventListener('change', function(){
        modalInnerFrame.style.width = "0px";
        modalInnerFrame.style.height = "0px";
        if(!modaltrigger){

            modaltrigger = true;
            // console.log(modaltrigger);
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
            
            // setTimeout(function(){
                //     login_form.style.display = "flex";
                // }, 600);
                
            }
        else{
            modaltrigger = false;
            // console.log(modaltrigger);
            
            modalWindow.style.opacity = "0";
            modal_elements_wrapper.style.opacity="0";
            modalWindow.style.transition = "opacity 0.3s";
            setTimeout(function(){
                modalWindow.style.display = "none";
            }, 400);

            modalInnerFrame.style.width = "0px";
            modalInnerFrame.style.height = "0px";
            // modal_elements_wrapper.style.opacity="0";
            // modal_elements_wrapper.style.transition="opacity 0.3s";
            
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
        // console.log('login');
        modalInnerFrame.style.width = "400px";
        modalInnerFrame.style.height = "400px";
        

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
        // console.log('signup');
        modalInnerFrame.style.width = "500px";
        modalInnerFrame.style.height = "800px";
        
        login_btn_label.style.color="#FB9832";
        login_form.style.display="none";
        login_form.style.opacity="0";
        
        setTimeout(function(){
            signup_form.style.opacity="1";
            signup_form.style.transition="opacity 0.3s";
        }, 300);

        signup_form.style.display="flex";
        signup_btn_label.style.color="#FB9832";

        const signup_pwd = document.querySelector('#signup_pwd');
        const signup_pwd_check = document.querySelector('#signup_pwd_check');
        const signup_name = document.querySelector('#signup_name');
        const signup_birth = document.querySelector('#signup_birth');
        const signup_email = document.querySelector('#signup_email');
        const signup_phone = document.querySelector('#signup_phone');
        const signup_addr = document.querySelector('#signup_addr');
        const address_section_zipcode = document.querySelector('#address_section_zipcode');
        const signup_addr_detail = document.querySelector('#signup_addr_detail');
        
        //우편번호, 주소
		$('#signup_addr').css('border-bottom', 'solid 1px red');
		$('#signup_addr').css('box-shadow', '0 4px 1px -3px red');
		signup_addr.classList.add('default_placeholder_red');
		
		$('#address_section_zipcode').css('border-bottom', 'solid 1px red');
		$('#address_section_zipcode').css('box-shadow', '0 4px 1px -3px red');
		address_section_zipcode.classList.add('default_placeholder_red');
		
        
		signup_pwd_check.addEventListener('focusout', function(){
            console.log(signup_pwd.value);
            console.log(signup_pwd_check.value);
            if(signup_pwd.value){
	            if(signup_pwd.value === signup_pwd_check.value){
					$('#signup_pwd').css('border-bottom', 'solid 1px green');
					$('#signup_pwd').css('box-shadow', '0 4px 1px -3px green');
					$('#signup_pwd_check').css('border-bottom', 'solid 1px green');
					$('#signup_pwd_check').css('box-shadow', '0 4px 1px -3px green');
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
	            }
            }
        });
		
		signup_name.addEventListener('focusout', function(){
			if(signup_name.value){
				$('#signup_name').css('border-bottom', 'solid 1px green');
				$('#signup_name').css('box-shadow', '0 4px 1px -3px green');
			}
        });
		signup_birth.addEventListener('focusout', function(){
			if(signup_birth.value){
				$('#signup_birth').css('border-bottom', 'solid 1px green');
				$('#signup_birth').css('box-shadow', '0 4px 1px -3px green');
			}
        });
		signup_email.addEventListener('focusout', function(){
			if(signup_email.value){
				$('#signup_email').css('border-bottom', 'solid 1px green');
				$('#signup_email').css('box-shadow', '0 4px 1px -3px green');
			}
        });
		signup_phone.addEventListener('focusout', function(){
			if(signup_phone.value){
				$('#signup_phone').css('border-bottom', 'solid 1px green');
				$('#signup_phone').css('box-shadow', '0 4px 1px -3px green');
			}
        });
		signup_addr_detail.addEventListener('focusout', function(){
			if(signup_addr_detail.value){
				$('#signup_addr_detail').css('border-bottom', 'solid 1px green');
				$('#signup_addr_detail').css('box-shadow', '0 4px 1px -3px green');
			}
        });
		
//		function isEmail(email) {
//			 var regex = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i;
//
//			 return regex.test(email);
//		}
    }	
};


/** 검색 Ajax 부분 **/

function searchInput(){
    $("#search_input").autocomplete({ 
            source : function( request, response ) {
                 const autoValues = $.ajax({
                     url: "search.jsp", 
                     dataType: "json",
                      data: {
                          searchValue: request.term
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
       // The following works only once.
       // $(this).trigger('keydown.autocomplete');
       // As suggested by digitalPBK, works multiple times
       // $(this).data("autocomplete").search($(this).val());
       // As noted by Jonny in his answer, with newer versions use uiAutocomplete
       $(this).data("uiAutocomplete").search($(this).val());
   });
    
    $.ui.autocomplete.prototype._renderItem = function (ul, item) {
        item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
        return $("<li></li>")
                .data("item.autocomplete", item)
                .append("<a>" + item.label + "</a>")
                .appendTo(ul);
    };
    

	const duplicate_btn = document.querySelector('#id_section_btn');
	id_section_btn.addEventListener('click', function(){
		const userID = $('#id_section_input').val();
	if(!userID){
		alert("하이");
	}
	else{
		console.log(userID);
		$.ajax({
			type: 'POST',
			url:'/online-shopping-mall/MemberRegisterCheckServlet',
			data: {userID: userID},
//	         아이디 중복체크부
			success : function(result) {
				if(result == 1){
					$('#id_section_input').css('border-bottom', 'solid 1px green');
					$('#id_section_input').css('box-shadow', '0 4px 1px -3px green');
					document.getElementById('signup_pwd').focus();
	                
				}else{
			        const id_section_input = document.querySelector('#id_section_input');
					$('#id_section_input').css('border-bottom', 'solid 1px red');
					$('#id_section_input').css('box-shadow', '0 4px 1px -3px red');
					id_section_input.placeholder = "아이디가 중복되었습니다.";
					id_section_input.classList.add('default_placeholder_red');
					id_section_input.value = '';
					 $('#id_section_input').focus();
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


init();