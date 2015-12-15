class Expansion < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :cards
  belongs_to :blocks

  validates :set_name, presence: true
  validates :image, presence: true
  validates :block_id, presence: true

  scope :expansions_asc, -> { order("created_at ASC") }
  scope :visible, -> { where(:hidden => false) }
  scope :hidden, -> { where(:hidden => true) }

end
