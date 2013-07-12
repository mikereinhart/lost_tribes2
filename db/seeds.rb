Event.delete_all
User.delete_all

Event.create(title: 'Oktoberfest', date: '2010-10-10 16:19:00 UTC', street_address: '123 German Way', city: 'Rye', state: 'NY', description: 'Ya, we gettin drunk man, ya!')
Event.create(title: 'Reinhart-fest', date: '2010-10-10 16:19:00 UTC', street_address: '156 Whitney Ave', city: 'Pompton Lakes', state: 'NJ', description: 'Come to my house, drink beer, swim, then sleep. then bagels. delicious bagels.')
Event.create(title: 'Beerfest', date: '2010-10-10 16:19:00 UTC', street_address: '345 Main St', city: 'New York', state: 'NY', description: 'Placeholding description!')


u1 = User.create(admin: false, vendor: false, name: 'Mike', email: 'mike@test.com', zip: 44122, password: 'mike', phone_number: '973-570-2263', street_address: '156 Whitney Ave', city: 'Pompton Lakes', state: 'NJ')
u2 = User.create(admin: false, vendor: false, name: "mike", email: "mike@email.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
u3 = User.create(admin: false, vendor: true, name: "chris",  email: "chris@email.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
u4 = User.create(admin: true, vendor: true, name: "ryan", email: "ryan@email.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
u5 = User.create(admin: false, vendor: true, name: "jon doe", email: "john@email.com", zip: 44122, password: 'password', phone_number: '777-777-7777', street_address: '123 Main St', city: 'New York', state: 'NY', street_address_2: 'Apt A')
