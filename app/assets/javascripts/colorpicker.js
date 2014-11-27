$(document).on('click', '.picker', function(){
  $(this).colpick({
    layout:'hex',
    submit:0,
    colorScheme:'dark',
    onChange:function(hsb,hex,rgb,el,bySetColor) {
      $(el).css('border-color','#'+hex);
      // Fill the text box just if the color was set using the picker, and not the colpickSetColor function.
      if(!bySetColor) $(el).val(hex);
    }
    }).keyup(function(){document.getElementById("color").readOnly = true;
    $(this).colpickSetColor(this.value);
  });
});
