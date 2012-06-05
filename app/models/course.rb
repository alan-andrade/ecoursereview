# == Schema Information
#
# Table name: courses
#
#  id             :integer         not null, primary key
#  provider       :string(255)
#  title          :string(255)
#  url            :string(255)
#  subject        :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  average_rating :integer
#  youtube_url    :string(255)
#  description    :text
#  level          :string(255)
#  image_url      :string(255)
#  course_code    :string(255)
#

class Course < ActiveRecord::Base
  attr_accessible :provider, :subject, :title, :url, :average_rating, :youtube_url, :description, :level, :image_url, :course_code
  validates :title, uniqueness: true
  has_many :professors, through: :relationships
  has_many :relationships, foreign_key: "professor_id", dependent: :destroy
  
end
