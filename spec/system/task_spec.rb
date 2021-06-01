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
      expect(page).to have_content 'task1'
      expect(page).to have_content 'desc1'
    end
  end
end
  context "when the link 期限でソート is clicked" do
    it "sorts the task list by deadline in ascending order" do
      task = FactoryBot.create(:task)
      task2 = FactoryBot.create(:task2)
      task3 = FactoryBot.create(:task3)
      visit tasks_path
      click_on '期限でソート'
      task_list = all('.deadline')
      sleep 0.3
      # expect(task_list[0]).to have_content "task7"
      # expect(task_list[1]).to have_content "task1"
      # expect(task_list[2]).to have_content "task5"
      expect(task_list[0]).to have_content "2021-05-03"
      expect(task_list[1]).to have_content "2021-06-01"
      expect(task_list[2]).to have_content "2021-06-09"
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
      expect(page).to have_text ('task7')
      expect(page).to have_text ('task5')
      expect(page).to have_text ('task1')
    end
  end
  context 'when fuzzy searched by task name' do
    it 'shows matching result' do
      task = FactoryBot.create(:task)
      visit tasks_path
      fill_in :search_name, with: '7'
      click_button '検索'
      expect(page).to have_content 'task7'
    end
  end
  context 'when searched by status' do
    it 'shows matching result' do
      task = FactoryBot.create(:task)
      visit tasks_path
      select '完了', from: "status"
      click_button '検索'
      expect(page).to have_content '完了'
    end
  end
  context 'when fuzzy searched by task name and status' do
    it 'shows matching result' do
      task = FactoryBot.create(:task)
      visit tasks_path
      fill_in :search_name_status, with: '7'
      select '完了', from: "status"
      click_button '検索'
      expect(page).to have_content 'task7'
    end
  end
end
describe 'Show page' do
  context 'when an user visits a task description page' do
    it 'shows task description' do
      task = FactoryBot.create(:task)
      visit tasks_path
      expect(page).to have_text ('task7')
    end
  end
end

