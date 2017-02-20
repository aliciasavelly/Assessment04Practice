# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
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
