class AddColumnsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :text
    add_column :tasks, :status, :text
  end
end
