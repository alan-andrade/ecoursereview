class AddRatingToCourse < ActiveRecord::Migration
  def change
      add_column :courses, :average_rating, :integer
  end
end
