class AddShortUrlToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :short_url, :string
  end
end
