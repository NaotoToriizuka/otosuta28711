require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
    # driven_by(:rack_test)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム(最大6文字)', with: @user.nickname
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード(英数字6文字以上)', with: @user.password
      fill_in 'パスワード確認', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # トップページにログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報では新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム(最大6文字)', with: ""
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード(英数字6文字以上)', with: ""
      fill_in  'パスワード確認', with: ""
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ログインできるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      # トップページにログインページへ遷移するボタンがあることを確認する
      # ログインページへ遷移する
      # 正しいユーザー情報を入力する
      # ログインボタンを押す
      # トップページへ遷移することを確認する
      # ログアウトボタンが表示されていることを確認する
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
    end
  end
  context 'ログインできないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      # トップページにログインページへ遷移するボタンがあることを確認する
      # ログインページへ遷移する
      # ユーザー情報を入力する
      # ログインボタンを押す
      # ログインページへ戻されることを確認する
    end
  end
end
