class Universe < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :universe_name, presence: true
  validates :image, presence: true

  has_many :comics

  scope :visible, -> { where(:hidden => false) }
  scope :hidden, -> { where(:hidden => true) }
end
