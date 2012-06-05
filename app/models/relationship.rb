# == Schema Information
#
# Table name: relationships
#
#  id           :integer         not null, primary key
#  course_id    :integer
#  professor_id :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :course_id, :professor_id
  
  belongs_to :courses
  belongs_to :professors
  validates_uniqueness_of :course_id, :scope => :professor_id
  validates_uniqueness_of :professor_id, :scope => :course_id
end
