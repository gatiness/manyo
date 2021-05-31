require 'rails_helper'
RSpec.describe 'Task model', type: :model do
  describe 'validation test' do
    context 'when task name field is empty' do
      it 'violates presence validation' do
        task = Task.new(name: '', description: 'desc1')
        expect(task).not_to be_valid
      end
    end
    context 'when task description is empty' do
      it 'violates presence vailidation' do
        task = Task.new(name: 'task1', description: '')
        expect(task).not_to be_valid
      end
    end
    context 'when task name and description fields are filled' do
      it 'goes through validation' do
        task = Task.new(name: 'task1', description: 'desc1')
      end
    end
  end

  describe 'scope test' do
    let!(:task) { FactoryBot.create(:task, name: 'task7', due_date: '2021-05-03', status: 2) }
    let!(:task2) { FactoryBot.create(:task2, name: 'task5', due_date: '2021-06-09', status: 1) }
    context "when fuzzy search performed by task name" do
      it "shows result(s) includes the keyword" do
        expect(Task.search_name(7)).to include(task)
        expect(Task.search_name(7)).not_to include(task2 )
        expect(Task.search_name(7).count).to eq 1
      end
    end
    context 'when searched by status' do
      it 'shows the matching result' do
        expect(Task.search_status('完了')).to include(task)
        expect(Task.search_status('完了')).not_to include(task2)
        expect(Task.search_status('完了').count).to eq 1
      end
    end
    context 'when fuzzy searched by task name and status' do
      it 'shows the matching result(s)' do   
        expect(Task.search_name(7)).to include(task)
        expect(Task.search_name(7)).not_to include(task2)
        expect(Task.search_name(7).count).to eq 1
        expect(Task.search_status('完了')).to include(task)
        expect(Task.search_status('完了')).not_to include(task2)
        expect(Task.search_status('完了').count).to eq 1 
      end
    end
  end
end
