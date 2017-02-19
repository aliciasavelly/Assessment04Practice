# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
end
