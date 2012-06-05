class AddIndexToRelationships < ActiveRecord::Migration
  def change
      add_index :relationships, :course_id
      add_index :relationships, :professor_id
      add_index :relationships, [:course_id, :professor_id], unique: true
  end
end
