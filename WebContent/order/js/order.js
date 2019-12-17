function paymentMethod(value){//결제방법 변경 시 입력창 변경 
		if(value=='신용카드'){tr1.style.display = '';
			tr2.style.display = 'none';
		}
		else if(value=='휴대폰'){
			tr1.style.display = 'none';
			tr2.style.display = '';
		}
		else{
			tr1.style.display = 'none';
			tr2.style.display = 'none';
		}
	}
	function agreement(){//약관 미 동의시 진행안됨. 
		var chk = document.getElementById("agreement");
		if(chk.checked){
			document.write("<h3>결재가 완료되었습니다.</h3>");
		}else{ 
			alert("약관에 동의해주세요.");
			return;
		}
	}