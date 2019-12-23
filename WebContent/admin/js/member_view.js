function init(){
    const member_update_btn =  document.getElementById('update');
    const member_delete_btn =  document.getElementById('delete');
    const member_name =  document.getElementById('member_name');
    const member_id =  document.getElementById('member_id');
    const member_birthday =  document.getElementById('member_birthday');
    const member_joindate =  document.getElementById('member_joindate');
    const member_contact =  document.getElementById('member_contact');
    const member_email =  document.getElementById('member_email');
    const member_point =  document.getElementById('member_point');
    const member_zipcode =  document.getElementById('member_zipcode');
    const member_address =  document.getElementById('member_address');
    const member_address_detail =  document.getElementById('member_address_detail');
    const addr_btn = document.getElementById('addr_btn');
    const member_inputs = document.querySelectorAll('.member_inputs');
    console.log('������Ʈ �Ϸ�');
    let update_btn_readonly_off = 0;
    let page_loading_flag = 0;	//������ �ε�����
    
    member_delete_btn.style.backgroundColor = "#FF5F59";

    openDaumZipAddress();
    function ajaxEvent(){
    	if(!page_loading_flag){
    		console.log("ajax inn");
	    	  //������ �ε� �̺�Ʈ
    		page_loading_flag = "1";
	    	    $.ajax({
	    	        type: 'POST',                   //post or get
	    	        url:ctx+'/member/memberdetail',   //servlet mapping addr
	    	        data: {member_id: member_id.value
	    	            },                              //key value
	    	        success : function(data) {
	    	        	console.log(data);
	    	    		let resultParse = JSON.parse(data);
	    	    		console.log(resultParse[0]);
	    	    		member_name.value = resultParse[0].name;
	    	    		member_birthday.value = resultParse[0].birthday;
	    	    		member_joindate.value = resultParse[0].joindate;
	    	    		member_contact.value = resultParse[0].contact;
	    	    		member_email.value = resultParse[0].email;
	    	    		member_point.value = resultParse[0].point;
	    	    		member_zipcode.value = resultParse[0].zipcode;
	    	    		member_address.value = resultParse[0].address;
	    	    		member_address_detail.value = resultParse[0].address_detail;

	    	    		resultParse.shift();
	    	    		console.log(resultParse);/*
	    	    		$('#order_table').DataTable({
	    	    			data: resultParse,
	    	    			columns : [
	    	    				{ data: 'index' },
	    	    		        { data: 'o_del_date' },
	    	    		        { data: 'o_index' },
	    	    		        { data: 'p_name' },
	    	    		        { data: 'o_total_amount' },
	    	    		        { data: 'o_total_amount' },
	    	    		        { data: 'return_state' }
	    	    			]
	    	    		});*/
	    			 }, error : function(){
	    	            //�������
	    	            console.log('����');
	    	        }
	    	    })
	    	
    	}else{
    		console.log("�ȳ� ");
    	}
    }
    
    function update_member_detail(){
	    	  //������ �ε� �̺�Ʈ
	    	    $.ajax({
	    	        type: 'POST',                   //post or get
	    	        url:ctx+'/member/memberdetailupdate',   //servlet mapping addr
	    	        data: {member_id: member_id.value,
	    	        	member_birthday : member_birthday.value,
	    	        	member_joindate : member_joindate.value,
	    	        	member_contact : member_contact.value,
	    	        	member_email : member_email.value,
	    	        	member_zipcode : member_zipcode.value,
	    	        	member_address : member_address.value,
	    	        	member_address_detail : member_address_detail.value
	    	            },                              //key value
	    	        success : function(data) {
	    	        	alert('������Ʈ �Ϸ�');
	    	        	console.log("success����");
	    			 }, error : function(){
	    	            //�������
	    	            console.log('����');
	    	        }
	    	    })
    }
    member_delete_btn.addEventListener('click', function(){
    	//ȸ��������������
    	const deleteConfirm = confirm('ȸ�������� �����Ͻðڽ��ϱ�?');
    	if(deleteConfirm){
    	    $.ajax({
    	        type: 'POST',                   //post or get
    	        url:ctx+'/member/deletemember',   //servlet mapping addr
    	        data: {
    	        	member_id: member_id.value,
    	            },                              //key value
    	        success : function(data) {
    	        	if(data==1){
        	        	alert('ȸ�������� �����Ǿ����ϴ�.');
        	        	location.href="http://localhost/online-shopping-mall/admin/member_list.jsp";
    	        	}else{
    	        		alert('����');
    	        	}
    			 }, error : function(){
    	            //�������
    	            console.log('����');
    	        }
    	    })
    	}
    	else{
    		alert('������ ��ҵǾ����ϴ�.');
    	}
    })
    member_update_btn.addEventListener('click', function(){
    	if(update_btn_readonly_off===1){
    		update_btn_readonly_off = 0;	//�����Ϸ�(������ ����)
    		member_update_btn.value = "����";
			addr_btn.disabled = true;
    		member_update_btn.style.backgroundColor = "#fec084";
    		member_inputs.forEach(function(items){
    		items.readOnly = true;
    		items.classList.add('disabled');
    		});
    		offDaumZipAddress();
    		update_member_detail();
    	}
    	else{
    		update_btn_readonly_off = 1;	//��������
    		member_update_btn.value = "�����Ϸ�";
			addr_btn.disabled = false;
    		console.log('��������!');
    		member_update_btn.style.backgroundColor = "#EB6B1C";
    		member_inputs.forEach(function(items){
    			items.readOnly = false;
    			items.classList.remove('disabled');
    		});
    		
    	}
    });

	ajaxEvent();
	

	console.log("init complete");
	console.log(page_loading_flag);
}
function openDaumZipAddress() {
    // �����ȣ ã�� ȭ���� ���� element�� ����
    const element_wrap = document.getElementById("daumWrap2");

	element_wrap.style.position  = "absolute";
    // wrap ���̾ off�� ���¶�� ���� �����ȣ ���̾ open �Ѵ�.
    if($("#daumWrap2").css("display") == "none") {
        new daum.Postcode({
            oncomplete:function(data) {
                $("#member_zipcode").val(data.zonecode);
                $("#member_address").val(data.address);
                $("#member_address_detail").focus();
            }
            // ����ڰ� ���� �ּҸ� �����ؼ� ���̾ ���� ���
            // ���� �ּҷ� ���̾ ������ ���� ��Ų��.
            , onclose:function(state) {
                if(state === "COMPLETE_CLOSE") {
                    // �ݹ��Լ��� �����Ͽ� �����̵� �� ����� ���� �Ϸ��� �۾��� �����Ѵ�.
                    offDaumZipAddress(function() {
                        element_wrap.style.display = "none";
                    });
                }
            }
        }).embed(element_wrap);

        // �����̵� �ٿ� ����� �̿��� ���̾� â�� �����Ѵ�.
        $("#daumWrap2").slideDown();
    }
    
    // warp ���̾ open�� ���¶�� ���� �����ȣ ���̾ off ���·� �����Ѵ�.
    else {
        // �ݹ��Լ��� �����Ͽ� �����̵� �� ����� ���� �Ϸ��� �۾��� �����Ѵ�.
        offDaumZipAddress(function() {
            element_wrap.style.display = "none";
            return false;
        });
    }
}

function offDaumZipAddress() {
	// �����̵� �� ����� �̿��� ���̾� â�� �ݴ´�.
    $("#daumWrap2").slideUp();

}

init();