class AddPhotoToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :photo_file_name, :string
    add_column :tasks, :photo_content_type, :string
    add_column :tasks, :photo_file_size, :integer
    add_column :tasks, :photo_updated_at, :datetime
  end
end
