class Game < ActiveRecord::Base

  belongs_to :tabletop_games

  validates :name, presence: true
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :game_asc, -> { order("name ASC") }

  scope :by_letter, lambda{|l| where("games.name like ?","#{l}%")}

  def tabletop_game

  end

  after_initialize :init

  def init
    self.stock ||= 0
  end


  def self.search_by_game_name(name)
    return Game.no_results if name.blank?
    name = "%#{name}%"
    where ['name like ?', address] #for frisbee
  end

end
