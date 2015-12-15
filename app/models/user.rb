class User < ActiveRecord::Base
  has_secure_password
  validates :username, :presence => true, :uniqueness => true
  validates :password, length: { minimum: 1 }, allow_nil: false

  #before_save :encrypt_password
  #after_save :clear_password

  scope :is_admin, -> { where(:admin => true) }

  #def self.authenticate(username, password)
    #user = User.find_by_username(username)
    #if user
      #return user
    #else
      #return false
    #end
  #end

  #def match_password(password)
    #print("\n\n\n Password = #{password} \n Hashed Password = #{hashed_password}\n\n\n")
    #hashed_password == BCrypt::Password.new(password)
    #print("\n\n\n Password = #{password} \n\n\n")
  #end

  #private
  #def encrypt_password()
    #print("\n\n\nEncrypting password\n\n\n")
    #if password.present?
      #self.hashed_password = BCrypt::Password.create(password)
    #end
  #end

  #def clear_password
    #self.password = nil
  #end
end
