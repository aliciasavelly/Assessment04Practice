class User < ActiveRecord::Base
  validates :password, length: {minimum: 6, message: "is too short (minimum is 6 characters)"}
  validates :password_digest, presence: {message: "can't be blank"}
  validates :session_token, :username, presence: true
  before_validation :ensure_session_token
  has_many :links
  has_many :comments

  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = Usr.find_by(username: username)
    return user if user && user.is_password?(password)
    nil
  end
end
