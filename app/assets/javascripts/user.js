function delete_user(e){
  e.preventDefault(); 
  console.log('Entered Function delete_user');

  var user_row = $(this).parent().parent();
  var id_of_user = user_row.data('user-id');

  $.ajax({
    type: 'DELETE',
    url: 'users/'+id_of_user,
    success: function(data){
      console.log(user_row)
      var this_row = $('tr[data-user-id='+id_of_user+']')      
      this_row.animate({
        backgroundColor: 'red'
      }, 300, function(){
        $(this).fadeOut(300);
      }); 
      }
    });
  return $(this); 
}

$(function(){


$('tbody').on('click', '.delete-button', delete_user)
});