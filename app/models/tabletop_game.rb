class TabletopGame < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :games

  validates :set_name, presence: true
  #validates :image, presence: true
end
