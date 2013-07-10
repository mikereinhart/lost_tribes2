Event.delete_all
User.delete_all

e1 = Event.create(title: 'Oktoberfest', date: '2010-10-10 16:19:00 UTC', street_address: '123 German Way', city: 'Rye', state: 'NY', zip_code: '12345', description: 'Ya, we gettin drunk man, ya!')
e2 = Event.create(title: 'Reinhart-fest', date: '2010-10-10 16:19:00 UTC', street_address: '156 Whitney Ave', city: 'Pompton Lakes', state: 'NJ', zip_code: '07442', description: 'Come to my house, drink beer, swim, then sleep. then bagels. delicious bagels.')
e3 = Event.create(title: 'Beerfest', date: '2010-10-10 16:19:00 UTC', street_address: '345 Main St', city: 'New York', state: 'NY', zip_code: '11206', description: 'Placeholding description!')