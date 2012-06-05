# == Schema Information
#
# Table name: professors
#
#  id         :integer         not null, primary key
#  course_id  :string(255)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  image_url  :string(255)
#  bio        :text
#

class Professor < ActiveRecord::Base
  attr_accessible :course_id, :name, :image_url, :bio
  has_many :courses, through: :relationships
  has_many :relationships, foreign_key: "course_id", dependent: :destroy
  validates :name, uniqueness: true
end
