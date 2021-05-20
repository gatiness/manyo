require 'rails_helper'
RSpec.describe 'Task model', type: :model do
  describe 'validation test' do
    context 'when task name field is empty' do
      it 'violates presence validation' do
        task = Task.new(task_name: '', task_description: 'desc1')
        expect(task).not_to be_valid
      end
    end
    context 'when task description is empty' do
      it 'violates presence vailidation' do
        task = Task.new(task_name: 'task1', task_description: '')
        expect(task).not_to be_valid
      end
    end
    context 'when task name and description fields are filled' do
      it 'goes through validation' do
        task = Task.new(task_name: 'task1', task_description: 'desc1')
      end
    end
  end
end      
