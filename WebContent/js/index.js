
let slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}
playAlert = setInterval(function() {
	slideIndex += 1;
	showDivs(slideIndex);
	}, 5000);

function showDivs(n) {
  let i;
  const x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.opacity = "0";
    x[i].style.transition = "opacity 2s ease-out";
    x[i].style.overflow = "hidden";


  }
  x[slideIndex-1].style.opacity = "1";
}