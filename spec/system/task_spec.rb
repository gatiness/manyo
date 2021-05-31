require 'rails_helper'
RSpec.describe 'Task', type: :system do

describe 'New task' do
  context "when new task gets created" do
    it 'appears in the index page' do
      visit tasks_path
      click_on '新規タスク作成'
      fill_in :task_name, with: 'task1'
      fill_in :task_description, with: 'desc1'
      click_button 'タスクを作成'
      expect(page).to have_text ('task1')
      expect(page).to have_text ('desc1')
    end
  end
end
  context "when the link 期限でソート is clicked" do
    it "sorts the task list by deadline in ascending order" do
      visit tasks_path
      click_on '期限でソート'
      task_list = all('.task_row')
      expect(task_list[0]).to have_text tasks.first.name
    end
  end
# describe 'Index page' do
#   context 'when an user visits index page' do
#     it 'shows existing tasks' do
#       task = FactoryBot.create(:task)
#       task2 = FactoryBot.create(:task2)
#       task3 = FactoryBot.create(:task3)
#       visit tasks_path
#       expect(page).to have_text ('task1')
#       expect(page).to have_text ('task2')
#       expect(page).to have_text ('task3')
#     end
#   end
# end
# describe 'Show page' do
#   context 'when an user visits a task description page' do
#     it 'shows task description' do
#       task = FactoryBot.create(:task)
#       visit tasks_path
#       expect(page).to have_text ('task1')
#     end
#   end
# end
# describe 'Index page' do
#   context 'when tasks are listed in descending order' do
#     it 'shows the newest task on top' do
#       task = FactoryBot.create(:task)
#       task2 = FactoryBot.create(:task2)
#       task3 = FactoryBot.create(:task3)
#       visit tasks_path
#       task_list = all('.task')
#       expect(task_list[0]).to have_text ('task3')
#     end
#     end
#   end
end

