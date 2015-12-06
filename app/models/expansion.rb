class Expansion < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :cards
  belongs_to :blocks

  validates :set_name, presence: true
  validates :image, presence: true
  validates :block, presence: true
  scope :expansions_asc, -> { order("created_at ASC") }
end
