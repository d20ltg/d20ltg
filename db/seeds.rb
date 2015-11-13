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

Card.delete_all
Card.create! id: 1, name: 'Mickey Mantle', color: 'blue'
Card.create! id: 2, name: 'Hank Aaron', color: 'red'
Card.create! id: 3, name: 'Nolan Ryan', color: 'gray'
Card.create! id: 4, name: 'Babe Ruth', color: 'blue'
