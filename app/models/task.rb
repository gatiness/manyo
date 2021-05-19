class Task < ApplicationRecord
  validates :task_name, presence: true, uniqueness: true, length:{ maximum:25} 
end
