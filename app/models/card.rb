class Card < ActiveRecord::Base

  has_many :printings

  belongs_to :expansions

  scope :card_asc, -> { order("name ASC") }

  scope :by_letter, lambda{|l| where("cards.name like ?","#{l}%")}

  def expansion
    
  end


  def self.search_by_card_name(name)
    return Card.no_results if name.blank?
    name = "%#{name}%"
    where ['name like ?', address] #for frisbee
  end
end
