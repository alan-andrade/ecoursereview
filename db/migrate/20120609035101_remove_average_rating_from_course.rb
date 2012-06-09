class RemoveAverageRatingFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :average_rating
  end
end
