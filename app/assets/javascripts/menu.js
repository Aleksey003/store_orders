$(document).ready(function()
{
  /*-------------------------------------------    
      On State
  -------------------------------------------*/
$('#main-nav li').each(function() {
  var href = $(this).find('a').attr('href');
  if (href === window.location.pathname) {
    $(this).addClass('on');
  }
});

  /*-------------------------------------------    
      Grey Initial Values
  -------------------------------------------*/
  var filled = $('input.filled');
    
  if(filled.length > 0){
    for(var i = 0; i < filled.length; i++){
              
      $(filled[i]).addClass('empty');
      filled[i].initialValue = filled[i].value;
      
      filled[i].onclick = filled[i].onfocus = function(){
        $(this).removeClass('empty');
        $(this).addClass('filled');
        if(this.value == this.initialValue){
          this.value= '';
        }
      }
      
      filled[i].onblur = function(){
        if(this.value == this.initialValue || this.value == ''){
          $(this).addClass('empty');
          $(this).removeClass('filled');
          this.value = this.initialValue;
        }else{
          $(this).addClass('empty');
          $(this).removeClass('filled');
        }
      }
    }
  }
  
  else
  {
    return; 
  }
  
});

// left sideba menu
$(document).ready(function () {
      $('a.toggler').click(function () {
          $(this).parent().children('ul.tree').toggle(300, function(){

           if ($(this).parent().children('ul.tree').css('display')!='none'){ 
            $(this).parent().children('a.toggler').children('i').removeClass("icon-plus").addClass("icon-minus");
           }
           else {$(this).parent().children('a.toggler').children('i').addClass("icon-plus").removeClass("icon-minus")}

         });
                 
          
      });

      $('ul.tree').toggle();
      $('a.toggler').prepend('<i class="icon-plus "></i>');
  });