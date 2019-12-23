    function init(){
        const member_search_btn = document.querySelector('#member_search_btn');

        member_search_btn.addEventListener('click', function(){
            //셀렉트박스 선택 변수
            const select_type = document.getElementById('select_type').value;
            const select_value = document.getElementById('select_value').value;

            if(select_value){
                console.log(select_type);
                console.log(select_value);

                //member_ajax start
                $.ajax({
                    type: 'POST',                   //post or get
                    url:ctx+'/member/memberlist',   //servlet mapping addr
                    data: {select_type: select_type,
                            select_value : select_value
                        },                              //key value
                    success : function(result) {
                        if(result == 1){
                            //성공 이벤트
                            
                        }else{
                            //실패 이벤트
                        }
                    }, error : function(){
                        //에러경우
                        alert("error");
                    }
                })
            }else{
                alert("내용을 입력해주세요");
            }
        });
    }
    init();