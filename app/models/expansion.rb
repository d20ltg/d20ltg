class Expansion < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :cards

  scope :expansions_asc, -> { order("created_at ASC") }
end
