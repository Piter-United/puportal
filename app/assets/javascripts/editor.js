$(function(){
  $('.lepture_editor').each(function(node, index){
    var editor = new Editor({ element: node })
    editor.render()
  });
});
