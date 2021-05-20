require 'rails_helper'
RSpec.describe 'Task', type: :system do
describe 'New task' do
  context "when new task gets created" do
    it 'appears in the index page' do
      
      visit tasks_path
      click_link '新規タスク作成'
      fill_in :task_task_name, with: 'ランチを食べる'
      fill_in :task_task_description, with: '麻婆茄子を作る'
      click_button 'タスクを作成'
      expect(page).to have_text ('ランチを食べる')
    end
  end
end
describe 'Index page' do
  context 'when an user visits index page' do
    it 'shows existing tasks' do
      task = FactoryBot.create(:task)
      task2 = FactoryBot.create(:task2)
      task3 = FactoryBot.create(:task3)
      visit tasks_path
      expect(page).to have_text ('task1')
      expect(page).to have_text ('task2')
      expect(page).to have_text ('task3')
    end
  end
end
describe 'Show page' do
  context 'when an user visits a task description page' do
    it 'shows task description' do
      task = FactoryBot.create(:task)
      visit tasks_path
      expect(page).to have_text ('task1')
    end
  end
end
end
