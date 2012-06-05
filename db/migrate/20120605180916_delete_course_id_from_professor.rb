class DeleteCourseIdFromProfessor < ActiveRecord::Migration
  def change
     remove_column :professors, :course_id 
  end
end
