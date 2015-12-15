class Block < ActiveRecord::Base

  has_many :expansions
  
  scope :being_visible, -> { joins(:expansions).where("expansions.hidden like ?", false) }
end
