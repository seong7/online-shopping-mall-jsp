const myinfo_name = document.getElementById('myinfo_name');
const myinfo_pwd1 = document.getElementById('myinfo_pwd1');
const myinfo_pwd2 = document.getElementById('myinfo_pwd2');
const myinfo_birthday = document.getElementById('myinfo_birthday');
const myinfo_email = document.getElementById('myinfo_email');
const myinfo_contact = document.getElementById('myinfo_contact');
const myinfo_detail_addr = document.getElementById('myinfo_detail_addr');

function info_check(){
    if(myinfo_name.value===null || myinfo_name.value.length()===0){
        console.log('dd');
    }
}