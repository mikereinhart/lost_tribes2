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

  //gets and stores each of the row's text values, also trimming their whitespace
  var title = $.trim(event_row.find('.event_title').text());
  var date = $.trim(event_row.find('.event_date').text());
  var street = $.trim(event_row.find('.event_address').text());
  var street2 = $.trim(event_row.find('.event_address_2').text());
  var city = $.trim(event_row.find('.event_city').text());
  var state = $.trim(event_row.find('.event_state').text());
  var zip = $.trim(event_row.find('.event_zip').text());
  var description = $.trim(event_row.find('.event_description').text());


  if (parseInt() < 1 ) {
    alert("Error: street Address is a required field.")
  }


  $('#event_title').val(title);
  $('#event_date').val(date);
  $('#event_street_address').val(street);
  $('#event_street_address2').val(street2);
  $('#event_city').val(city);
  $('#event_state').val(state);
  $('#event_zip_code').val(zip);
  $('#event_description').val(description);

  //Hide the Create Task button and show the Update Task button
  $('#submit').addClass('hidden');
  $('#event-update-submit').removeClass('hidden');
  $('#event-update-submit').attr('data-event-id', event_id);

}

function update_event(e) {
  e.preventDefault();

  var event_id = $(this).data('event-id');

  var params = {
    event: {
      title: $('#event_title').val(),
      date: $('#event_date').val(),
      street_address: $('#event_street_address').val(),
      street_address2: $('#event_street_address2').val(),
      city: $('#event_city').val(),
      state: $('#event_state').val(),
      zip_code: $('#event_zip_code').val(),
      description: $('#event_description').val()
    }
  };

$.ajax({
  type: 'PUT',
  url: '/events/' + event_id,
  data: params,
  dataType: 'script'
});

var corresponding_row = $('tr[data-event-id='+event_id+']');
console.log('corresponding_row '+ corresponding_row);
corresponding_row.children('.event_title').text(params.event.title);
corresponding_row.children('.event_date').text(params.event.date);
corresponding_row.children('.event_address').text(params.event.street);
corresponding_row.children('.event_address_2').text(params.event.street2);
corresponding_row.children('.event_city').text(params.event.city);
corresponding_row.children('.event_state').text(params.event.state);
corresponding_row.children('.event_zip').text(params.event.zip);
corresponding_row.children('.event_description').text(params.event.description);
}



function display_event(e){
  // console.log('made it into display_event');
  e.preventDefault();

  $('.event-display').empty();
  $('#add-to-user').removeClass('hidden');

  var event_row = $(this).parent();
  var event_id = event_row.attr('data-event-id');

  var title = $.trim(event_row.find('.event_title').text());
  var date = $.trim(event_row.find('.event_date').text());
  var street = $.trim(event_row.find('.event_address').text());
  var street2 = $.trim(event_row.find('.event_address_2').text());
  var city = $.trim(event_row.find('.event_city').text());
  var state = $.trim(event_row.find('.event_state').text());
  var zip = $.trim(event_row.find('.event_zip').text());
  var description = $.trim(event_row.find('.event_description').text());

  // $('#add-to-user').attr('data-event-id', event_id);
  $($('#add-to-user').children()[0]).attr('href', event_id+"/register");
  // $($('#add-to-user').children()[0]).attr('data', current_user);

  $('<h2>').text(title).appendTo('.event-display');
  $('<p>').text("When: "+date).appendTo('.event-display');
  $('<p>').text(street+ " " + street2).appendTo('.event-display');
  $('<p>').text(city+ ", " + state+ " "+ zip).appendTo('.event-display');
  $('<p>').text("Details: "+description).appendTo('.event-display');

}

// =========================================================

$(function(){
  $('tbody').on('click', '.event-delete', delete_event);
  $('tbody').on('click', '.event-edit', populate_form);
  $('#event-update-submit').on('click', update_event);
  $('.event_title').on('click', display_event);
  // $('#add-to-user').on('click', )
});