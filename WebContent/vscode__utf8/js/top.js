function init(){

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
                modalInnerFrame.style.height = "500px";
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
        
        /* 회원가입 form . display : none 설정 필요*/
        signup_form.style.display="none";
        signup_btn_label.style.color="rgb(161, 157, 157)";
        
        login_form.style.display="flex";
        login_btn_label.style.color="#333";
        
        
        
        
    }else{
        // console.log('signup');
        
        login_btn_label.style.color="rgb(161, 157, 157)";
        login_form.style.display="none";
        
        /* 회원가입 form . display : "flex" 설정 필요*/
        signup_form.style.display="flex";
        signup_btn_label.style.color="#333";
    }
};


  init();