function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	function dateCheck(){
		f=document.searchFrm;
		if(f.keyDate1.value.length=="" || f.keyDate1.value.length!==8){
			alert("�Ⱓ�� �ùٸ��� �Է����ּ��� ex) 20191217")
			f.keyDate1.focus();
			return;
		}
		if(f.keyDate2.value.length=="" || f.keyDate2.value.length!==8){
			alert("�Ⱓ�� �ùٸ��� �Է����ּ��� ex) 20191217")
			f.keyDate2.focus();
			return;
		}document.searchFrm.submit();
	}
	
	function list() {//����Ʈ�� �̵�
		document.listFrm.action = "order_list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage) {//�������� ���̴� ����
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(o_index) {
		document.readFrm.o_index.value = o_index;
		document.readFrm.action = "order_view.jsp";
		document.readFrm.submit();
	}
		
	function pageing(page) {//pageStart ���� ������??
			document.readFrm.nowPage.value = page;
			document.readFrm.submit();
		}