class Task < ApplicationRecord
  validates :task_name, presence: true, uniqueness: true, length:{ maximum:25} 
  validates :task_description, presence: true, uniqueness: true, length:{ maximum:200} 
end
