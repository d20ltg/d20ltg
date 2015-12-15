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

User.create username: 'admin', hashed_password: 'admin', admin: true

Block.delete_all
Expansion.delete_all
Card.delete_all
TabletopGame.delete_all
Game.delete_all
Universe.delete_all
Comic.delete_all

block1 = Block.create block_name: 'Innistrad'
block2 = Block.create block_name: 'Khans of Tarkir'

ex1 = Expansion.create set_name: 'Innistrad',       image: seed_image('liliana.jpg'), block_id: block1.id
ex2 = Expansion.create set_name: 'Dark Ascension',  image: seed_image('sorin.jpg'),   block_id: block1.id
ex3 = Expansion.create set_name: 'Avacyn Restored', image: seed_image('avacyn.jpg'),  block_id: block1.id

Card.create name: 'Forest',                      card_type: 'Land',                       expansion_id: ex1.id
Card.create name: 'Forest',                      card_type: 'Land',                       expansion_id: ex2.id
Card.create name: 'Forest',                      card_type: 'Land',                       expansion_id: ex3.id
Card.create name: 'Island',                      card_type: 'Land',                       expansion_id: ex1.id
Card.create name: 'Island',                      card_type: 'Land',                       expansion_id: ex2.id
Card.create name: 'Island',                      card_type: 'Land',                       expansion_id: ex3.id
Card.create name: 'Liliana of the Veil',         card_type: 'Planeswalker - Liliana',     expansion_id: ex1.id
Card.create name: 'Doomsayer',                   card_type: 'Creature - Human',           expansion_id: ex1.id
Card.create name: 'Thalia, Guardian of Thraben', card_type: 'Legendary Creature - Human', expansion_id: ex3.id
Card.create name: 'Think Twice',                 card_type: 'Instant',                    expansion_id: ex1.id
Card.create name: 'Bonfire of the Damned',       card_type: 'Sorcey',                     expansion_id: ex3.id
Card.create name: 'Entreat the Angels',          card_type: 'Sorcey',                     expansion_id: ex3.id
Card.create name: 'Sorin Lord of Innistrad',     card_type: 'planeswalker - Sorin',       expansion_id: ex2.id
Card.create name: 'Wolfir Silverheart',          card_type: 'Creature - Wolf',            expansion_id: ex3.id
Card.create name: 'Terminus',                    card_type: 'Sorcey',                     expansion_id: ex3.id
Card.create name: 'Snapcaster Mage',             card_type: 'Creature - Wizard',          expansion_id: ex1.id
Card.create name: 'Lingering Souls',             card_type: 'Sorcey',                     expansion_id: ex2.id
Card.create name: 'Thraben Doomsayer',           card_type: 'Creature - Human Cleric',    expansion_id: ex2.id
Card.create name: "Geralf's Messenger",          card_type: 'Creature - Zombie',          expansion_id: ex2.id
Card.create name: 'Gravecaller',                 card_type: 'Creature - Zombie',          expansion_id: ex2.id

game1 = TabletopGame.create set_name: 'Monopoly',          image: seed_image('monopoly.jpg')
game2 = TabletopGame.create set_name: 'Settlers of Catan', image: seed_image('settlers.jpg')

Game.create name: 'Star Wars Monopoly',          tabletop_game_id: game1.id
Game.create name: 'Star Trek Settlers of Catan', tabletop_game_id: game2.id

universe1 = Universe.create universe_name: 'Batman', image: seed_image('batman.jpg')

Comic.create comic_name: 'Batman Returns', condition: 1, universe_id: universe1.id
