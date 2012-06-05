class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :course_id
      t.string :name

      t.timestamps
    end
  end
end
