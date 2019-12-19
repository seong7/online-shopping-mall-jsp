function init(){
    const member_search_btn = document.querySelector('#member_search_btn');

    member_search_btn.addEventListener('click', function(){
        console.log(document.querySelector('#select').value());
    });
}
init();