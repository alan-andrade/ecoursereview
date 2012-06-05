class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :provider
      t.string :title
      t.string :url
      t.string :subject

      t.timestamps
    end
  end
end
