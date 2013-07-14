Event.delete_all
User.delete_all

e1 = Event.create(title: 'Oktoberfest', date: '2010-10-10 16:19:00 UTC', street_address: '123 German Way', city: 'Rye', state: 'NY', zip_code: '12345', description: 'Ya, we gettin drunk man, ya!', street_address2: 'Apt C' )
e2 = Event.create(title: 'Reinhart-fest', date: '2010-10-10 16:19:00 UTC', street_address: '156 Whitney Ave', city: 'Pompton Lakes', state: 'NJ', zip_code: '07442', description: 'Come to my house, drink beer, swim, then sleep. then bagels. delicious bagels.', street_address2: 'apt a')
e3 = Event.create(title: 'Beerfest', date: '2010-10-10 16:19:00 UTC', street_address: '345 Main St', city: 'New York', state: 'NY', zip_code: '11206', description: 'Placeholding description!', street_address2: 'Apt b')

# u1 = User.create(name: "mike", email: "mreinhart88@yahoo.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
# u2 = User.create(name: "Jim", email: "mreinhart88@gmail.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
u3 = User.create(vendor: true, name: "vendor", email: "vendor@email.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
u4 = User.create(admin: false, name: "customer", email: "customer@email.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
u5 = User.create(admin: true, name: "admin", email: "admin@email.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')

u3.events << e3 << e2
u3.created_events << e1

u5.events << e1 << e2
u5.created_events << e3
