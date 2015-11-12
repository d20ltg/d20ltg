class User < ActiveRecord::Base
  validates_presence_of :username
  validates_uniqueness_of :username

  scope :is_admin, -> { where(:admin => true) }

  def self.authenticate(username, password)
    user = User.find_by_username(username)
  end
end
