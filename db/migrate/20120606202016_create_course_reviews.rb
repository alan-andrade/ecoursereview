class CreateCourseReviews < ActiveRecord::Migration
  def change
    create_table :course_reviews do |t|
      t.integer :course_id
      t.integer :rating
      t.text :text
      t.integer :user_id

      t.timestamps
    end
  end
end
