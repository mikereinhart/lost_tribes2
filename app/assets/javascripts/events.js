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


function populate_form(e){
  console.log('entered populate form function');
  e.preventDefault();

  //remembers the row that the button was pressed in and the task id for that row
  //note that I have refactored to put data-task-id on rows and not on the buttons themselves
  var event_row = $(this).parent().parent();
  var event_id = event_row.attr('data-event-id');

  //gets and stores each of the row's text values, including the hidden priority id, also trimming their whitespace
  var name = $.trim(event_row.find('.title').text());
  var date = $.trim(event_row.find('.date').text());
  var city = $.trim(event_row.find('.city').text());
  // var priority_id = $.trim(event_row.find('.priority-id').text());

  //Sets each of the form's fields and selects the correct selection for priority field
  $('#event-title').val(title);
  $('#event-date').val(date);
  $('#event-city').val(city);
  $('#event-state').val(state);
  // $('#task_priority_id option[value=' + priority_id +']').prop('selected', true);

  //Hide the Create Task button and show the Update Task button
  $('#submit').addClass('hidden');
  $('#add-submit').removeClass('hidden');
  $('#add-submit').attr('data-event-id', event_id);
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

  $('tbody').on('click', '.title', populate_form);

  // $('#submit').on('click', create_event);

});