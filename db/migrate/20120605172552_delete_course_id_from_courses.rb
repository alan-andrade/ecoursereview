class DeleteCourseIdFromCourses < ActiveRecord::Migration
  def change
     remove_column :courses, :course_id 
  end
end
