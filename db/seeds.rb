# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_name}"))
end

Store.create(
  store_address: '2207 Fairfax St, Eau Claire, WI 54701',
  store_phone: '(715) 456-9738',
  store_email: 'info@d20gamers.com',
  store_description: "Eau Claire's hometown games",
  store_hours: '10 am - 8 pm'
)

TabletopGame.delete_all
Expansion.delete_all
Card.delete_all
Block.delete_all
Event.delete_all

Expansion.create! id: 1, set_name: 'Khans of Tarkir'

Card.create! id: 1, expansion_id: 1, name: 'Act of Treason', color: 'blue'
Card.create! id: 2, expansion_id: 1, name: 'Arrow Storm', color: 'red'
Card.create! id: 3, expansion_id: 1, name: 'Alpine Grizzly', color: 'gray'
Card.create! id: 4, expansion_id: 1, name: 'Abzan Guide', color: 'blue'

User.create(
  username: 'admin',
  hashed_password: 'admin',
  admin: true
)

Block.create(
  block_name: 'Innistrad'
)

Block.create(
  block_name: 'Swag Master'
)

Expansion.create(
  set_name: 'Innistrad',
  image: seed_image('liliana.jpg'),
  block_id: 1
)

Expansion.create(
  set_name: 'Dark Ascension',
  image: seed_image('sorin.jpg'),
  block_id: 1
)

Expansion.create(
  set_name: 'Avacyn Restored',
  image: seed_image('avacyn.jpg'),
  block_id: 1
)

Expansion.create(
  set_name: 'Jamison The Swag Lord',
  image: seed_image('jamison.jpg'),
  block_id: 2
)

Card.create(
  name: 'Forest',
  card_type: 'Land',
  expansion_id: 1
)

Card.create(
  name: 'Forest',
  card_type: 'Land',
  expansion_id: 2
)

Card.create(
  name: 'Forest',
  card_type: 'Land',
  expansion_id: 3
)

Card.create(
  name: 'Island',
  card_type: 'Land',
  expansion_id: 1
)

Card.create(
  name: 'Island',
  card_type: 'Land',
  expansion_id: 2
)

Card.create(
  name: 'Island',
  card_type: 'Land',
  expansion_id: 3
)

Card.create(
  name: 'Liliana of the Veil',
  card_type: 'Planeswalker - Liliana',
  expansion_id: 1
)

Card.create(
  name: 'Doomsayer',
  card_type: 'Creature - Human',
  expansion_id: 1
)

Card.create(
  name: 'Thalia, Guardian of Thraben',
  card_type: 'Legendary Creature - Human',
  expansion_id: 3
)

Card.create(
  name: 'Think Twice',
  card_type: 'Instant',
  expansion_id: 1
)

Card.create(
  name: 'Bonfire of the Damned',
  card_type: 'Sorcey',
  expansion_id: 3
)

Card.create(
  name: 'Entreat the Angels',
  card_type: 'Sorcey',
  expansion_id: 3
)

Card.create(
  name: 'Sorin Lord of Innistrad',
  card_type: 'planeswalker - Sorin',
  expansion_id: 2
)

Card.create(
  name: 'Wolfir Silverheart',
  card_type: 'Creature - Wolf',
  expansion_id: 3
)

Card.create(
  name: 'Terminus',
  card_type: 'Sorcey',
  expansion_id: 3
)

Card.create(
  name: 'Snapcaster Mage',
  card_type: 'Creature - Wizard',
  expansion_id: 1
)

Card.create(
  name: 'Lingering Souls',
  card_type: 'Sorcey',
  expansion_id: 2
)

Card.create(
  name: 'Thraben Doomsayer',
  card_type: 'Creature - Human Cleric',
  expansion_id: 2
)

Card.create(
  name: "Geralf's Messenger",
  card_type: 'Creature - Zombie',
  expansion_id: 2
)

Card.create(
  name: 'Gravecaller',
  card_type: 'Creature - Zombie',
  expansion_id: 2
)

Card.create(
  name: "Jamison's Daily Planner",
  card_type: 'Talk to you about stuff he needs to get done... then does a quarter of it',
  expansion_id: 4
)

Card.create(
  name: 'Jamison At the Joint',
  card_type: 'He will never get Bored',
  expansion_id: 4
)

Card.create(
  name: 'Jamison As a Friend',
  card_type: 'You will never get Bored',
  expansion_id: 4
)

TabletopGame.create(
  set_name: 'Monopoly',
  image: seed_image('monopoly.jpg')
)

TabletopGame.create(
  set_name: 'Settlers of Catan',
  image: seed_image('settlers.jpg')
)

Game.create(
  name: 'Star Wars Monopoly',
  tabletop_game_id: 0
)

Game.create(
  name: 'Star Trek Settlers of Catan',
  tabletop_game_id: 1
)

Event.create(
  event_type: 'lol',
  title: "Don't miss SE today",
  description: "Dr. Tan will be doing the teapot in a GB Packers jersey in class today... if Dr. Hart accepts his bet... JUST DO IT RYAN. DO IT!",
  event_day: "2015-12-04"

)
