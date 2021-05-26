class AddDueDateToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :due_date, :date, null: false, default: -> { 'NOW()' }
  end
end
