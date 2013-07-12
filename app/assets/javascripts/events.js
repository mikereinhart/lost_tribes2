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
  var title = $.trim(event_row.find('.title').text());
  var date = $.trim(event_row.find('.date').text());
  var street = $.trim(event_row.find('.street_address').text());
  var street2 = $.trim(event_row.find('.street_address_2').text());
  var city = $.trim(event_row.find('.city').text());
  var state = $.trim(event_row.find('.state').text()); 
  var zip = $.trim(event_row.find('.zip').text()); 
  var description = $.trim(event_row.find('.description').text()); 

  // var priority_id = $.trim(event_row.find('.priority-id').text());

  //Sets each of the form's fields and selects the correct selection for priority field
  $('#event_title').val(title);
  $('#event_date').val(date);
  $('#event_street_address').val(street);
  $('#event_street_address2').val(street2);
  $('#event_city').val(city);
  $('#event_state').val(state);
  $('#event_zip_code').val(zip);
  $('#event_description').val(description);
  // $('#task_priority_id option[value=' + priority_id +']').prop('selected', true);

  //Hide the Create Task button and show the Update Task button
  $('#submit').addClass('hidden');
  $('#add-submit').removeClass('hidden');
  $('#add-submit').attr('data-event-id', event_id);
}



$(function(){
  $('tbody').on('click', '.event-delete', delete_event);
  $('tbody').on('click', '.event-edit', populate_form);
  // $('#submit').on('click', create_event);

});