class Card < ActiveRecord::Base

  has_many :printings

  belongs_to :expansions
end
