class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :course_id
      t.integer :professor_id

      t.timestamps
    end
  end
end
