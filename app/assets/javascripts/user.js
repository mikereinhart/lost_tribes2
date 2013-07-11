function delete_user(e){
  e.preventDefault(); 

  var user_row = $(this).parent().parent();
  var id_of_user = user_row.data('user-id');

  $.ajax({
    type: 'DELETE',
    url: id_of_user,
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
  return $(this); }


function populate_form(e){
  console.log("we are in populate form")
  e.preventDefault(); 

  var user_row = $(this).parent().parent();
  var user_id = user_row.attr('data-user-id');

  var this_row = $('tr[data-user-id='+user_id+']') 

  console.log("user_row is" + user_row)
  console.log("user_id is"+ user_id)
  console.log("this_row: "+ this_row)


  var name = $.trim(user_row.find('#user_name').text());
  var vendor = $.trim(user_row.find('#user_vendor').text());
  var admin = $.trim(user_row.find('#user_admin').text()); 
  var password = $.trim(user_row.find('#user_password').text());
  var email = $.trim(user_row.find('#user_email').text());
  var phone = $.trim(user_row.find('#user_phone_number').text());
  var street = $.trim(user_row.find('#user_street_address').text()); 
  var street2 = $.trim(user_row.find('#user_street_address_2').text());
  var city  = $.trim(user_row.find('#user_city').text());  
  var state = $.trim(user_row.find('#user_state').text()); 
  var zip = $.trim(user_row.find('#user_zip').text()); 

  console.log("---------------")
  console.log("var vendor is " + vendor);
  console.log('var admin is '+ admin);
  console.log("var password is "+ password)
  console.log("---------------")
  console.log("user zip is "+ zip); 

  $('#user_name').val(name); 
  $('#user_vendor').val(vendor); 
  $('#user_admin').val(admin); 
  $('#user_email').val(email);
  $('#user_password').val(password); 
  $('#user_phone_number').val(phone); 
  $('#user_street_address').val(street); 
  $('#user_street_address_2').val(street2);
  $('#user_city').val(city);
  $('#user_state').val(state)
  $('#user_zip').val(zip);


}

function update_user(e){
  console.log("we are in update user")
  e.preventDefault();

  var user_id = $(this).data('user-id'); 

  var params = {
    user: {
      name: $('#user_name').val(),   
      email: $('#user_email').val(),   
      phone: $('#user_phone').val(),  
      street_address: $('#user_street_address').val(), 
      street_address_2: $('#user_street_address_2').val(),
      city: $('#user_city').val(),
      state: $('#user_state').val(),
      zip: $('#user_zip').val(),
      // vendor: $('#user_vendor').val(),
      // admin: $('#user_admin').val()
    }
  };

  $.ajax({
    type: 'PUT',
    url: '/users/' + user_id,
    data: params,
    dataType: 'script'
  }); 

}






$(function(){


$('tbody').on('click', '.delete-button', delete_user); 
$('tbody').on('click', '.edit-button', populate_form);
$('#edit-submit').on('click', update_user); 

});