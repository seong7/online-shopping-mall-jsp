function init(){
	const star_wrapper = document.getElementsByClassName('rate_star_wrapper');
	const r_content_wrapper = document.getElementsByClassName('r_content_wrapper');
	const reviewWriteFrm = document.getElementsByName('reviewWriteFrm');
	//document.getElementsByName('reviewWriteFrm')[0].childNodes[7]
	//document.getElementsByClassName('r_content_wrapper')[i].childNodes[1].value
	
	//초기화
	for(let i=0; i<star_wrapper.length; i++){
		star_wrapper[i].childNodes[5].childNodes[1].classList.add('fas');
		star_wrapper[i].childNodes[5].childNodes[1].classList.remove('far');
		star_wrapper[i].childNodes[5].childNodes[1].classList.remove('nStar');
		star_wrapper[i].childNodes[5].childNodes[1].classList.add('yStar');
		/*마우스 호버*/
		
		
	}
	
	for(let j=0; j<reviewWriteFrm.length; j++){
		reviewWriteFrm[j].childNodes[7].addEventListener('click',function(){
			console.log(reviewWriteFrm[j]);
			if(!r_content_wrapper[j].childNodes[1].value){
				console.log("없음");
			}
			//			reviewWriteFrm[j].submit();
		});
	}
	for(let i=0; i<star_wrapper.length; i++){
		star_wrapper[i].childNodes[5].addEventListener('click', function(){
			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('far');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('far');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('far');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('far');
			
			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('nStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('nStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('nStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('nStar');
		});
		star_wrapper[i].childNodes[11].addEventListener('click', function(){
			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('far');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('far');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('far');
	
			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('nStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('nStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('nStar');
		});
		star_wrapper[i].childNodes[17].addEventListener('click', function(){
			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('far');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('far');
			
	
			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('nStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('nStar');
		});
		star_wrapper[i].childNodes[23].addEventListener('click', function(){
			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('fas');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('far');		
			

			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('yStar');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('nStar');
		});
		star_wrapper[i].childNodes[29].addEventListener('click', function(){
			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('far');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('fas');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('fas');		

			star_wrapper[i].childNodes[5].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.remove('nStar');
			star_wrapper[i].childNodes[5].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[11].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[17].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[23].childNodes[1].classList.add('yStar');
			star_wrapper[i].childNodes[29].childNodes[1].classList.add('yStar');
		});
	}
	
	function consolelog(){
		console.log("이벤트1");
	}
}
init();