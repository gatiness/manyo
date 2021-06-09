require 'rails_helper'

RSpec.feature 'ユーザ登録テスト', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin) { FactoryBot.create(:admin) }

  describe 'ユーザ登録のテスト' do
    context '新規登録した場合' do
      it 'ユーザの新規登録ができる' do
        visit new_user_path
        fill_in '名前', with: 'araba'
        fill_in 'メールアドレス', with: 'aaa@amail.com'
        fill_in 'パスワード', with: '1111pppp'
        fill_in '確認用パスワード', with: '1111pppp'
        click_button 'アカウントを作成'
        expect(page).to have_content 'arabaのページ'
      end
    end

    context 'ログインせずタスク一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移する' do
        visit tasks_path
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
      end
    end

    context 'ログインしようとした場合' do
      it 'ユーザーがログインでき、マイページへ飛べる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@amail.com'
        fill_in 'session[password]', with: '1111pppp'
        click_button 'Log in'
        expect(page).to have_content 'arabaのページ'
      end
    end

    context 'ログアウトしようとした場合' do
      it 'ログアウトできる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@amail.com'
        fill_in 'session[password]', with: '1111pppp'
        click_button 'Log in'
        click_on 'ログアウト'
        expect(page).to have_content 'Log in'
      end
    end
  end

  describe '管理画面のテスト' do
    context '管理者がアクセスした場合' do
      it '管理画面にアクセスができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@jmail.com'
        fill_in 'session[password]', with: '1111qqqq'
        click_button 'Log in'
        click_link '管理画面'
        expect(page).to have_content '管理画面：ユーザー一覧'
      end
    end
    context 'ユーザーがアクセスした場合' do
      it '管理画面へは、管理者以外はアクセスできません' do
        visit new_user_path
        fill_in '名前', with: 'araba'
        fill_in 'メールアドレス', with: 'aaa@amail.com'
        fill_in 'パスワード', with: '1111pppp'
        fill_in '確認用パスワード', with: '1111pppp'
        click_button 'アカウントを作成'
        click_on 'タスク一覧に戻る'
        click_link '管理画面'
        expect(page).to have_content '管理画面へは、管理者以外はアクセスできません'
      end
  end

    context '管理者がユーザーを新規登録をした場合' do
      it '新規登録ができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@jmail.com'
        fill_in 'session[password]', with: '1111qqqq'
        click_button 'Log in'
        click_on 'タスク一覧に戻る'
        click_on '管理画面'
        click_link '新しくユーザーを作成する'
        fill_in '名前', with: 'test'
        fill_in 'メールアドレス', with: 'ccc@dic.com'
        fill_in 'パスワード', with: '123123'
        fill_in '確認用パスワード', with: '123123'
        click_button '登録する'
        expect(page).to have_content 'ID'
        expect(page).to have_content '管理権限'
      end
    end

    context '管理者がユーザーの詳細へアクセスをした場合' do
      it '詳細画面へ飛ぶことができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@jmail.com'
        fill_in 'session[password]', with: '1111qqqq'
        click_button 'Log in'
        click_link 'タスク一覧に戻る'
        click_link '管理画面'
        click_on '詳細を確認する', match: :first
        expect(page).to have_content 'ID'
        expect(page).to have_content '管理権限'
      end
    end

    context '管理者がユーザーの編集画面へアクセスをした場合' do
      it 'ユーザーの編集ができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@jmail.com'
        fill_in 'session[password]', with: '1111qqqq'
        click_button 'Log in'
        click_on 'タスク一覧に戻る'
        click_on '管理画面'
        click_on 'ユーザー情報を編集する', match: :first
        fill_in '名前', with: 'test'
        fill_in 'メールアドレス', with: 'ccc@dic.com'
        fill_in 'パスワード', with: '123123'
        fill_in '確認用パスワード', with: '123123'
        click_button 'アカウントを作成'
        expect(page).to have_content 'ID'
        expect(page).to have_content '管理権限'
      end
    end

    context '管理者がユーザーを削除した場合' do
      it 'ユーザーの削除ができる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@jmail.com'
        fill_in 'session[password]', with: '1111qqqq'
        click_button 'Log in'
        click_on 'タスク一覧に戻る'
        click_on '管理画面'
        click_on 'ユーザー情報を削除する', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '管理画面：ユーザー一覧'
      end
    end
  end
end
