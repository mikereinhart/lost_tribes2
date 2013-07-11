function delete_event(e){
  e.preventDefault();
  console.log('Entered function delete_task');

  var event_row = $(this).parent().parent();
  var id_of_event = event_row.data('event-id');

  $.ajax({
    type: 'DELETE',
    url: id_of_event,
    success: function(data){
      // console.log('Success!');

      event_row.animate({
        backgroundColor: 'red'
      }, 300, function(){
        $(this).fadeOut(300);
      });
    }
  });
  return $(this);
}

// function create_event(e){
//   e.preventDefault();

//   console.log('entered create event function');
//   var params = {
//     an_event: {
//       title: $('#event-title').val(),
//       date: $('#event-date').val(),
//       street_address: $('#event-street-address').val(),
//       street_address_2: $('#event-street-address-2').val(),
//       city: $('#event-city').val(),
//       state: $('#event-state').val(),
//       zip: $('#event-zip').val(),
//       description: $('#event-description').val()
//     }
//   };

//   $.post('/events', params, function(data) {
//     var an_event = $('<tr>').attr('event-id', data.event.id);
//   });

//   $('#events tbody').append(an_event);
//   console.log('make it all the way thru!');
// }





$(function(){

  $('tbody').on('click', '.event-delete', delete_event);

  // $('#submit').on('click', create_event);

});