class AddUserIdToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :user_id, :integer
  end
end
