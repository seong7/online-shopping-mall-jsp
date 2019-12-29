const reviewText = document.getElementById('reviewText');

function reviewCheck(){
	let reviewTextValue = reviewText.value;
	if(reviewTextValue){
		document.reviewWriteFrm.submit();
	}else{
		alert('리뷰를 입력해주세요.');
	}
}