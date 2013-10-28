class CreateRoams < ActiveRecord::Migration
  def change
    create_table :roams do |t|
      t.string :roamer_name
      t.integer :task_id

      t.timestamps
    end
  end
end
