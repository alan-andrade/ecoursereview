class AddCourseIdToCourse < ActiveRecord::Migration
  def up
     add_column :courses, :course_code, :string
  end
  
  def down
     remove_column :courses, :course_id, :string 
  end
end
