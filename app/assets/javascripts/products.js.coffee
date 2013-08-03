# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#slides").slidesjs
    width: 300
    height: 300
    navigation:
      effect: "fade"

    pagination:
      effect: "fade"

    effect:
      fade:
        speed: 400

  $("#tabs").tabs()      

 

   


