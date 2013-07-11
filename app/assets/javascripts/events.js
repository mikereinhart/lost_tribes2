
function delete_event(e){
  e.preventDefault();
  console.log('Entered function delete_task');

  var event_row = $(this).parent().parent();
  var id_of_event = event_row.data('event-id');

  $.ajax({
    type: 'DELETE',
    url: id_of_event,
    success: function(data){
      console.log('Success!');
    }
  });
  return $(this);
}







$(function(){

  $('tbody').on('click', '.delete-button', delete_event);

});