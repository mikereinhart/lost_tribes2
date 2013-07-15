function delete_user(e){
  e.preventDefault();

  var user_row = $(this).parent().parent();
  var id_of_user = user_row.data('user-id');

  $.ajax({
    type: 'DELETE',
    url: "users/"+id_of_user,
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


function populate_form(e){
  console.log("we are in populate form")
  e.preventDefault(); 

  var user_row = $(this).parent().parent();
  var user_id = user_row.attr('data-user-id');


  var this_row = $('tr[data-user-id='+user_id+']') 
  console.log("user_row is" + user_row)
  console.log("user_id is"+ user_id)
  console.log("this_row: "+ this_row)


  var name = $.trim(user_row.find('td.user_name').text())
  var vendor = $.trim(user_row.find('td.user_vendor').text())
  var admin = $.trim(user_row.find('.user_admin').text()); 
  var password = $.trim(user_row.find('.user_password').text());
  var email = $.trim(user_row.find('.user_email').text());
  var phone = $.trim(user_row.find('.user_phone_number').text());
  var street = $.trim(user_row.find('.user_street_address').text()); 
  var street2 = $.trim(user_row.find('.user_street_address_2').text());
  var city  = $.trim(user_row.find('.user_city').text());  
  var state = $.trim(user_row.find('.user_state').text()); 
  var zip = $.trim(user_row.find('.user_zip').text());  

  $('#user_name').val(name); 
  $('#user_vendor').val(vendor); 
  $('#user_admin').val(admin); 
  $('#user_email').val(email);
  $('#user_password').val(password); 
  $('#user_phone_number').val(phone); 
  $('#user_street_address').val(street); 
  $('#user_street_address_2').val(street2);
  $('#user_city').val(city);
  $('#user_state').val(state);
  $('#user_zip').val(zip);

  var user_id = user_row.data('user-id')
  $('#update-submit').attr('data-user-id', user_id);
  $('#update-submit').removeClass('hidden');
  $('#submit').addClass('hidden');
}

function update_user(e){
  e.preventDefault();
  console.log("inside updated user")

     
  var user_id = $(this).data('user-id');
  // same thing as above 
  //var user_id = $(this).attr('data-user-id');
    
  //###########################################################################
  // also -- why does zip return "edit" and "delete?"
  //###########################################################################

  //###########################################################################
  // next step: sort by admin and then sort by vendor. how do you sort by admin? 
  //###########################################################################


    console.log("user id "+ user_id)
    console.log("this " + this)


  var params = {
    user: {
      name: $('#user_name').val(),
      vendor: $('#user_vendor').val(),
      admin: $('#user_admin').val(),   
      email: $('#user_email').val(),   
      phone: $('#user_phone').val(),
      street_address: $('#user_street_address').val(), 
      street_address_2: $('#user_street_address_2').val(),
      city: $('#user_city').val(),
      state: $('#user_state').val(),
      zip: $('#user_zip').val()
    }
  };

  $.ajax({
    type: 'PUT',
    url: '/users/' + user_id,
    data: params,
    dataType: 'script'
  });

  var corresponding_row = $('tr[data-user-id='+ user_id+']')
  corresponding_row.children('.user_name').text(params.user.name)
  corresponding_row.children('.user_vendor').text(params.user.vendor)
  corresponding_row.children('.user_admin').text(params.user.admin)
  corresponding_row.children('.user_email').text(params.user.email)
  corresponding_row.children('.user_phone').text(params.user.phone)
  corresponding_row.children('.user_street_address').text(params.user.street_address)
  corresponding_row.children('.user_street_address_2').text(params.user.street_address_2)
  corresponding_row.children('.user_city').text(params.user.city)
  corresponding_row.children('.user_state').text(params.user.state)
  corresponding_row.children('.user_zip').text(params.user.zip)

  $('#user_name').val(''); 
  $('#user_vendor').val(''); 
  $('#user_admin').val(''); 
  $('#user_email').val('');
  $('#user_password').val(''); 
  $('#user_phone_number').val(''); 
  $('#user_street_address').val(''); 
  $('#user_street_address_2').val('');
  $('#user_city').val('');
  $('#user_state').val('');
  $('#user_zip').val('');
  
  console.log("params.user.name ---> " + params.user.name)
    $('#update-submit').addClass('hidden');
    $('#submit').removeClass('hidden');
  // corresponding_row.children('.user_name').text('Josh')
}

function filter_vendor(){
  console.log('in filter admin')
  $('.vendor_row').show(1000)
  $('.admin_row').hide(1000)
  $('.user_row').hide(1000)
}
function filter_admin(){
  $('.admin_row').show(1000)
  $('.vendor_row').hide(1000)
  $('.user_row').hide(1000)
}
function filter_user(){
  $('.admin_row').hide(1000)
  $('.vendor_row').hide(1000)
  $('.user_row').show(1000)

}
function filter_all(){
  $('.admin_row').show(1000)
  $('.vendor_row').show(1000)
  $('.user_row').show(1000)
}


$(function(){

$('tbody').on('click', '.delete-button', delete_user); 
$('tbody').on('click', '.edit-button', populate_form);
$('#update-submit').on('click', update_user); 
$('.filter_vendor').on('click', filter_vendor)
$('.filter_admin').on('click', filter_admin)
$('.filter_user').on('click', filter_user)
$('.filter_all').on('click', filter_all)



});

