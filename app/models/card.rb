class Card < ActiveRecord::Base

  has_many :printings

  belongs_to :expansions

  scope :card_asc, -> { order("name ASC") }

  def expansion
    
  end
end
