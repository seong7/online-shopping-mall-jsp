function init(){
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
                modalInnerFrame.style.width = "600px";
                modalInnerFrame.style.height = "800px";
            }, 80);
        }
        else{
            modalWindow.style.display = 'none';
            modaltrigger = false;
            modalInnerFrame.style.width = "0px";
            modalInnerFrame.style.height = "0px";
        }
    });
    //search ajax
    searchInput();
    inputTransition();
    
    
};

function searchInput(){
    $("#search_input").autocomplete({ 
            source : function( request, response ) {
                 const autoValues = $.ajax({
                     url: "search.jsp", 
                     dataType: "json",
                      data: {
                          searchValue: request.term
                         },
                          success: function(result) { 
                                response( 
                                   $.map( result, function(item) {
                                        return { 
                                            label: item.data,
                                            value: item.data 
                                        }
                                   })
                                );
                          }
                 });
        },  
        minLength: 1, 
        select: function( event, ui ) {
        	
        } 
   }).focus(function(){            
       // The following works only once.
       // $(this).trigger('keydown.autocomplete');
       // As suggested by digitalPBK, works multiple times
       // $(this).data("autocomplete").search($(this).val());
       // As noted by Jonny in his answer, with newer versions use uiAutocomplete
       $(this).data("uiAutocomplete").search($(this).val());
   });
    
    $.ui.autocomplete.prototype._renderItem = function (ul, item) {
        item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
        return $("<li></li>")
                .data("item.autocomplete", item)
                .append("<a>" + item.label + "</a>")
                .appendTo(ul);
    };
}

function inputTransition(){
    const input = document.querySelector('#search_input');
    let searchIcon = document.querySelector('.fa-search');

    input.addEventListener('focus', function(){
        searchIcon.style.color = "#ff9f43";
    });
    input.addEventListener("focusout", function(){
        searchIcon.style.color = "#a4b0be";
    });
}

init();