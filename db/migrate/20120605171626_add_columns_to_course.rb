class AddColumnsToCourse < ActiveRecord::Migration
  def change
      add_column :courses, :course_id, :string
      add_column :courses, :youtube_url, :string
      add_column :courses, :description, :text
      add_column :courses, :level, :string
      add_column :courses, :image_url, :string
      add_column :professors, :image_url, :string
      add_column :professors, :bio, :text
  end
end
