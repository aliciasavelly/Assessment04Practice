class Link < ActiveRecord::Base
  # validates :title, :user_id, presence: true
  # validates :url, uniqueness: true, presence: true
  # validates :user, presence: {message: "can't be blank"}
  validates :title, :url, :user, presence: true

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  has_many :comments,
    class_name: :Comment,
    foreign_key: :link_id,
    primary_key: :id
end
