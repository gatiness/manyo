class Task < ApplicationRecord
  validates :task_name, :string, limit: 25
end
