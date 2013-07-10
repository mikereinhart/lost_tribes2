User.delete_all 
Event.delete_all


u1 = User.create(name: "jon doe", email: "john@email.com", zip: 44122, password: 'password')

u1.created_events  