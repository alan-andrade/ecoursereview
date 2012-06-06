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

require 'spec_helper'

describe CourseReview do
  pending "add some examples to (or delete) #{__FILE__}"
end
