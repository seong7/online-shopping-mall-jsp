function init(){
    //모달 제어부
    let modaltrigger = false;
    const userCheckBox = document.querySelector('#userPopup');
    const modalWindow = document.getElementById('modalDiv');
    const modalInnerFrame = document.getElementById('modalInnerFrame');
    modalInnerFrame.style.width = "0px";
    modalInnerFrame.style.height = "0px";
    userCheckBox.addEventListener('change', function(){
        if(!modaltrigger){
            modalWindow.style.display = 'block';
            modaltrigger = true;
            setTimeout(function(){
                modalInnerFrame.style.width = "400px";
                modalInnerFrame.style.height = "500px";
            }, 80);
            console.log(modaltrigger);
        }
        else{
            modalWindow.style.display = 'none';
            modaltrigger = false;
            modalInnerFrame.style.width = "0px";
            modalInnerFrame.style.height = "0px";
        }
    });
};

  init();