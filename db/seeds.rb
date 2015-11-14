# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Store.create(
  store_address: '2207 Fairfax St, Eau Claire, WI 54701',
  store_phone: '(715) 456-9738',
  store_email: 'info@d20gamers.com',
  store_description: "Eau Claire's hometown games",
  store_hours: '10 am - 8 pm'
)

Expansion.delete_all
Expansion.create! id: 1, set_name: 'Khans of Tarkir'

Card.delete_all
Card.create! id: 1, expansion_id: 1, name: 'Act of Treason', color: 'blue'
Card.create! id: 2, expansion_id: 1, name: 'Arrow Storm', color: 'red'
Card.create! id: 3, expansion_id: 1, name: 'Alpine Grizzly', color: 'gray'
Card.create! id: 4, expansion_id: 1, name: 'Abzan Guide', color: 'blue'

User.create(
  username: 'admin',
  hashed_password: 'admin',
  admin: true
)
