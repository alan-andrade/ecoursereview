class AddAverageRatingToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :average_rating, :float
  end
end
