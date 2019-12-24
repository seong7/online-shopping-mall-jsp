	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	function dateCheck(){
		f=document.searchFrm;
		if(f.keyDate1.value.length=="" || f.keyDate1.value.length!==8){
			alert("기간을 올바르게 입력해주세요 ex) 20191217")
			f.keyDate1.focus();
			return;
		}
		if(f.keyDate2.value.length=="" || f.keyDate2.value.length!==8){
			alert("기간을 올바르게 입력해주세요 ex) 20191217")
			f.keyDate2.focus();
			return;
		}document.searchFrm.submit();
	}
	
	function list() {//리스트로 이동
		document.listFrm.action = "order_list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage) {//페이지당 보이는 개수
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(o_index) {
		document.readFrm.o_index.value = o_index;
		document.readFrm.action = "order_view.jsp";
		document.readFrm.submit();
	}
				
	function pageing(page) {//pageStart 값을 가져옴??
			document.readFrm.nowPage.value = page;
			document.readFrm.submit();
		}