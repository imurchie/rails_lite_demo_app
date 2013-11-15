require "active_record_lite"
require "bcrypt"

class User < ActiveRecordLite::SQLObject
  my_attr_accessible :name, :username, :password

  after_initialize { self.session_token = SecureRandom::urlsafe_base64(16) }

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
