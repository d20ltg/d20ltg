class TabletopGame < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
