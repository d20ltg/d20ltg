class Game < ActiveRecord::Base

  belongs_to :tabletop_games

  validates :name, presence: true

  scope :game_asc, -> { order("name ASC") }

  scope :by_letter, lambda{|l| where("games.name like ?","#{l}%")}

  def tabletop_game

  end

  after_initialize :init

  def init
  end


  def self.search_by_game_name(name)
    return Game.no_results if name.blank?
    name = "%#{name}%"
    where ['name like ?', address] #for frisbee
  end

end
