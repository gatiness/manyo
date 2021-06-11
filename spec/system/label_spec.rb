require 'rails_helper'
RSpec.describe 'ラベル登録機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }


  describe '新規タスクにラベルをつける機能' do
    before do
      visit new_session_path
      fill_in :session_email, with: 'aaa@amail.com'
      fill_in :session_password, with: '1111pppp'
      click_button 'Log in'
      visit tasks_path
    end
    context 'タスクの新規作成時にラベルを選んだ場合' do
      it 'タスクといっしょにラベルも表示される' do
        FactoryBot.create(:label)
        FactoryBot.create(:second_label)
        FactoryBot.create(:third_label)
        visit new_task_path
        fill_in "task_name", with: "task5"
        fill_in "task_description", with: "desc5"
        click_button 'タスクを作成'
        expect(page).to have_content 'task5'
        expect(page).to have_content 'test3'
      end
    end
    context 'ラベルで検索したら' do
      it 'そのラベルと紐づいてるタスクが表示される' do
        FactoryBot.create(:label)
        FactoryBot.create(:second_label)
        FactoryBot.create(:third_label)
        visit root_path
        select "test3", from: :label_id
        click_button '検索'
        expect(current_path).to have_content "/tasks"
        expect(page).to have_content 'test3'
      end
    end
  end
end
