class Comic < ActiveRecord::Base
  
  validates :comic_name, presence: true
  validates :condition, presence: true

  belongs_to :universes
end
