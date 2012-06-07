class ChangeAverageRatingColumnInCourses < ActiveRecord::Migration
  def up
      change_table :courses do |t|
          t.change :average_rating, :float
      end
  end

  def down
      change_table :courses do |t|
          t.change :average_rating, :integer
      end
  end
end
