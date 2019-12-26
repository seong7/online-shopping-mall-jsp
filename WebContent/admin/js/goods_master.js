
	window.onload = function(){
		function typeCheck(){
			const update_btn = document.querySelector('#update_btn');
			const delete_btn = document.querySelector('#delete_btn');
			
			update_btn.addEventListener('click', function(){
				const inputdata = 
				$('#buffer').val('update');
				$('#rFrame').submit();
			});
			delete_btn.addEventListener('click',function(){
				$('#buffer').val('delete');
				$('#rFrame').submit();
			});
		}
		typeCheck();
	}	
	
function confirm1(){	
	if(confirm("제발떠라응?")){
		alert("yes");
	}else{
		alert("no");
	}	
}    

function check() {
	f = document.SearchFrm;
	if(f.p_name.value.length==0 && f.p_date1.value.length==0 && f.p_date2.value.length==0){
		alert("제품명을 선택하세요");
		f.p_name.focus();
		return;
	}
	if(f.p_date1.value.length!=8 && f.p_date2.value.length==8){
		alert("기간을 올바르게 입력해주세요 ex) 20191217")
		f.p_date1.focus();
		return;
	}	
	if(f.p_date1.value.length==8 && f.p_date2.value.length!=8){
		alert("기간을 올바르게 입력해주세요 ex) 20191217")
		f.p_date2.focus();
		return;
	}
	function list() {
		document.listFrm.action = "goods_master.jsp";
		document.listFrm.submit();
	}	
	if(f.p_date1.value.length!=8 || f.p_date1.value.length!=8){
		alert("기간을 올바르게 입력해주세요 ex) 20191217")
		f.p_date1.focus();
		return;
	}
	f.submit();
}

function listSelect() {
	f = document.SearchFrm;
	pl = f.pnameList;
	f.p_name.value = pl.options[pl.selectedIndex].value;
}
 
/* checkbox javascript */
 
 function allChk() {
	f= document.rFrm;
	if(f.allCh.checked){
		for(i=0;i<f.fch.length;i++){
				/*항목의 체크버튼(fch)들이 배열이기에*/
			f.fch[i].checked = true;
		}
		f.delete.disabled = false;//버튼의 활성화
		f.update.disabled = false;//버튼의 활성화
	}else{
		for(i=0;i<f.fch.length;i++){
			f.fch[i].checked = false;
		}
		f.delete.disabled = true;//버튼의 비활성화	
		f.update.disabled = true;//버튼의 활성화
	}
}
 function chk(){
		f=document.rFrm;
		for(i=0; i<f.fch.length;i++){
			//alert(f.fch[i].value);
			if(f.fch[i].checked){ //fch 체크박스가 체크가 된 경우
				f.delete.disabled = false;
				f.update.disabled = false;//버튼의 활성화
			return; //밑에 있는 체크박스의 체크 유무는 무의미
			}
		}
		f.allCh.checked= false; //전체체크박스 해제
		f.delete.disabled = true; //버튼 비활성화
		f.update.disabled = true;//버튼의 활성화
	}
