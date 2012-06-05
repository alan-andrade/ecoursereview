# == Schema Information
#
# Table name: courses
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  title      :string(255)
#  url        :string(255)
#  subject    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Course < ActiveRecord::Base
  attr_accessible :provider, :subject, :title, :url
end
