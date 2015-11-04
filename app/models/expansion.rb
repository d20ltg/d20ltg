class Expansion < ActiveRecord::Base

  has_many :cards

  scope :expansions_asc, -> { order("created_at ASC") }
end
