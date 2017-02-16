class User < ActiveRecord::Base
  validates :password, length: {minimum: 6}
  validates :username, :password_digest, presence: {message: "can't be blank"}

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
