# == Schema Information
#
# Table name: course_reviews
#
#  id         :integer         not null, primary key
#  course_id  :integer
#  rating     :integer
#  text       :text
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class CourseReview < ActiveRecord::Base
  attr_accessible :course_id, :rating, :text, :user_id
  belongs_to :course
  belongs_to :user
  validates :text, uniqueness: true, presence: true
  validates :rating, presence: true
  acts_as_rateable
end
