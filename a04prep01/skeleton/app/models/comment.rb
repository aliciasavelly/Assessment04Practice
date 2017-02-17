class Comment < ActiveRecord::Base
  validates :body, :user_id, :link_id, presence: true
  validates :user, presence: true
  validates :link, presence: true
  belongs_to :link
  belongs_to :user
  # def user=(user)
  #   @user = user
  # end

  # def link=(link)
  #   @link = link
  # end
end
