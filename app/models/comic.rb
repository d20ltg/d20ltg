class Comic < ActiveRecord::Base
  
  validates :comic_name, presence: true
  validates :condition, presence: true
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :universes
end
