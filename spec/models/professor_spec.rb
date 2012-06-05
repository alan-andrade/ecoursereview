# == Schema Information
#
# Table name: professors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  image_url  :string(255)
#  bio        :text
#

require 'spec_helper'

describe Professor do
  pending "add some examples to (or delete) #{__FILE__}"
end
