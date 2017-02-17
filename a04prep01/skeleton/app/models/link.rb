class Link < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :url, uniqueness: true, presence: true
  validates :user, presence: {message: "can't be blank"}

  belongs_to :user
  has_many :comments

  def user=(user)
    @user = user
  end
end
