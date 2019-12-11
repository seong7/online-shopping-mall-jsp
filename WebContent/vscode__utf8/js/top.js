function init(){
	
    //search ajax
    searchInput();
    inputTransition();
    

    /******************  모달 제어부  *******************/

    let modaltrigger = false;
    const userCheckBox = document.querySelector('#userPopup');
    const modalWindow = document.getElementById('modalDiv');
    const modalInnerFrame = document.getElementById('modalInnerFrame');

    const modal_elements_wrapper = document.getElementById('modal_elements_wrapper');
    const login_form = document.getElementById('login_form');

    /** 모달창 열림 닫힘 기능 **/

    modalInnerFrame.style.width = "0px";
    modalInnerFrame.style.height = "0px";
    userCheckBox.addEventListener('change', function(){
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


    /** 로그인 id, pwd  input 태그 event **/
    // const login_input = document.querySelectorAll('.login_input');
    
    // [].forEach.call(login_input, function(inp){
    //    inp.addEventListener('focus', function(){
    //        console.log('hi');
    //    })
    //     }
    // )
};

/** 모달 header (로그인, 회원가입 라디오 버튼) **/

const login_form = document.getElementById("login_form");
const signup_form = document.getElementById("signup_form");
const login_btn_label = document.getElementById("login_btn_label");
const signup_btn_label = document.getElementById("signup_btn_label");

function login_signup(id){
    if(id=="login"){
        // console.log('login');
        modalInnerFrame.style.width = "400px";
        modalInnerFrame.style.height = "400px";
        
        /* 회원가입 form . display : none */
        signup_form.style.display="none";
        signup_btn_label.style.color="rgb(161, 157, 157)";
        
        login_form.style.display="flex";
        login_btn_label.style.color="#333";
        
        
        
        
    }else{
        // console.log('signup');
        modalInnerFrame.style.width = "500px";
        modalInnerFrame.style.height = "800px";
        
        login_btn_label.style.color="rgb(161, 157, 157)";
        login_form.style.display="none";
        
        /* 회원가입 form . display : "flex" */
        signup_form.style.display="flex";
        signup_btn_label.style.color="#333";
    }
};





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

