function paymentMethod(value){//������� ���� �� �Է�â ���� 
		if(value=='�ſ�ī��'){tr1.style.display = '';
			tr2.style.display = 'none';
		}
		else if(value=='�޴���'){
			tr1.style.display = 'none';
			tr2.style.display = '';
		}
		else{
			tr1.style.display = 'none';
			tr2.style.display = 'none';
		}
	}
	function agreement(){//��� �� ���ǽ� ����ȵ�. 
		var chk = document.getElementById("agreement");
		if(chk.checked){
			document.write("<h3>���簡 �Ϸ�Ǿ����ϴ�.</h3>");
		}else{ 
			alert("����� �������ּ���.");
			return;
		}
	}