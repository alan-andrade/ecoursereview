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
#  price          :integer
#  slug           :string(255)
#

require 'spec_helper'

describe Course do
  pending "add some examples to (or delete) #{__FILE__}"
end
