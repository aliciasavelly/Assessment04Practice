class User < ActiveRecord::Base
  attr_reader :password
  after_initialize :ensure_session_token

  validates :password, length: {minimum: 6, allow_nil: true}
  # validates :password_digest, presence: {message: "can't be blank"}
  validates :session_token, :password_digest, :username, presence: true

  has_many :links
  has_many :comments


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
    # self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.is_password?(password)
    nil
  end
end
