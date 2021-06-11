class AddForeignKeyToLabelings < ActiveRecord::Migration[5.2]
  def change
    add_reference :labelings, :task, foreign_key: true
    add_reference :labelings, :label, foreign_key: true
  end
end
