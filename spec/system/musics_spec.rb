require 'rails_helper'

RSpec.describe "教室登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @music = FactoryBot.build(:music)
    @music.image = fixture_file_upload('public/top_image.jpg')
    @genre = FactoryBot.create(:genre)
    @music_genre = FactoryBot.build(:music_genre)
  end
  context '教室登録ができるとき' do
    it 'ログインしたユーザーは登録できると教室詳細ページに登録した内容が表示されている' do
      # ログインする
      sign_in(@music_genre.genre)
      # 教室を掲載するページに遷移する
      visit new_music_path
      # フォームに情報を入力する
      attach_file '画像', "#{Rails.root}//public/top_image.jpg"
      fill_in '教室名', with: @music.name
      fill_in '教室の説明', with: @music.content
      check('エレキギター')
      fill_in '郵便番号', with: @music.post_code
      select ('神奈川')
      fill_in '市町村', with: @music.city
      fill_in '番地', with: @music.house_number
      fill_in '建物名', with: @music.building_name
      fill_in '最寄り駅', with: @music.station
      fill_in '駅徒歩(分)', with: @music.walk
      fill_in '電話番号', with: @music.phone_number
      fill_in 'メールアドレス', with: @music.mail
      fill_in '担当者名', with: @music.representative
      fill_in '営業時間', with: @music.hour
      fill_in '定休日', with: @music.holiday
      fill_in 'オフィシャルサイト', with: @music.url
      fill_in '授業料', with: @music.fee
      fill_in '備考', with: @music.remarks
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Music.count }.by(1)
      # トップページに遷移していることを確認する
      expect(current_path).to eq root_path
      # 教室一覧ページに遷移する
      visit rooms_path
      # 登録した名前から詳細ページに遷移する
      click_on('Otosuta教室')
      # visit room_path(@music_genre.music)
      # 登録した内容が存在することを確認する
      expect(page).to have_selector("img")
      # expect(page).to have_content(@music_genre.genre.name)
      expect(page).to have_content(@music.name)
      expect(page).to have_content(@music.content)
      expect(page).to have_content(@music.post_code)
      # expect(page).to have_content(@music.prefecture.name)
      expect(page).to have_content(@music.city)
      expect(page).to have_content(@music.house_number)
      expect(page).to have_content(@music.building_name)
      expect(page).to have_content(@music.station)
      expect(page).to have_content(@music.walk)
      expect(page).to have_content(@music.phone_number)
      expect(page).to have_content(@music.representative)
      expect(page).to have_content(@music.hour)
      expect(page).to have_content(@music.holiday)
      expect(page).to have_content(@music.url)
      expect(page).to have_content(@music.fee)
      expect(page).to have_content(@music.remarks)
    end
  end
  # context '教室登録ができないとき' do
  #   it '送る値が空の為、登録に失敗すること' do
  #     # ログインする
  #     sign_in(@music_genre.genre)
  #     # 教室を掲載するページに遷移する
  #     visit new_music_path
  #     # フォームに情報を入力する
  #     fill_in '教室名', with: ""
  #     fill_in '教室の説明', with: ""
  #     check('')
  #     fill_in '郵便番号', with: ""
  #     select ('---')
  #     fill_in '市町村', with: ""
  #     fill_in '番地', with: ""
  #     fill_in '建物名', with: ""
  #     fill_in '最寄り駅', with: ""
  #     fill_in '駅徒歩(分)', with: ""
  #     fill_in '電話番号', with: ""
  #     fill_in 'メールアドレス',with: ""
  #     fill_in '担当者名', with: ""
  #     fill_in '営業時間', with: ""
  #     fill_in '定休日', with: ""
  #     fill_in 'オフィシャルサイト', with: ""
  #     fill_in '授業料', with: ""
  #     fill_in '備考', with: ""
  #     # 送信した値がDBに保存されていないことを確認する
  #     expect{
  #       find('input[name="commit"]').click
  #     }.not_to change { Music.count }
  #     # 教室を掲載するページに戻る
  #     expect(current_path).to eq musics_path
  #   end
  # end
end

# RSpec.describe '教室情報編集', type: :system do
#   before do
#     @music1 = FactoryBot.create(:music)
#     @user = FactoryBot.create(:user)
#     @music = FactoryBot.build(:music)
#     @music.image = fixture_file_upload('public/top_image.jpg')
#     @music_genre1 = FactoryBot.create(:music_genre)
#     @music_genre2 = FactoryBot.create(:music_genre)
#   end
#   context '教室情報編集ができるとき' do
#     it 'ログインしたユーザーは自分が登録した教室情報の編集ができる' do
#       # 教室1を登録したユーザーでログインする
#       sign_in(@music_genre1.music)
#       # 教室一覧ページへ遷移する
#       visit rooms_path
#       # 登録した名前から詳細ページに遷移する
#       visit room_path(@music_genre1.music)
#       # 編集ページへ遷移する
#       visit edit_room_path(@music_genre1.music)
#       #すでに登録済みの内容がフォームに入っていることを確認する
#       expect(@music_genre1).to eq @music_genre1
#       # 教室内容を編集する
#       fill_in '教室名', with: "sample教室"
#       fill_in '教室の説明', with: "sampleです"
#       fill_in '郵便番号', with: "000-0000"
#       select ('東京都')
#       fill_in '市町村', with: "渋谷区"
#       fill_in '番地', with: "青山"
#       fill_in '建物名', with: "sampleビル"
#       fill_in '最寄り駅', with: "渋谷駅"
#       fill_in '駅徒歩(分)', with: "5"
#       fill_in '電話番号', with: "00012345678"
#       fill_in 'メールアドレス',with: "sample@test.com"
#       fill_in '担当者名', with: "sample"
#       fill_in '営業時間', with: "14時〜22時"
#       fill_in '定休日', with: "月曜日"
#       fill_in 'オフィシャルサイト', with: "sample"
#       fill_in '授業料', with: "1レッスン/1時間/5500円"
#       fill_in '備考', with: "sample"
#       # 編集してもMusicモデルのカウントは変わらないことを確認する
#       expect{
#         find('input[name="commit"]').click
#       }.to change { Music.count }.by(0)
#     end
#   end
#   context '教室情報編集ができないとき' do
#     it 'ログインしたユーザーは自分が登録した教室情報の編集ができるが、必須項目が空だと編集ページに遷移する' do
#       # 教室1を登録したユーザーでログインする
#       sign_in(@music_genre1.music)
#       # 教室一覧ページへ遷移する
#       visit rooms_path
#       # 登録した名前から詳細ページに遷移する
#       visit room_path(@music_genre1.music)
#       # 編集ページへ遷移する
#       visit edit_room_path(@music_genre1.music)
#       #すでに登録済みの内容がフォームに入っていることを確認する
#       expect(@music_genre1).to eq @music_genre1
#       # 教室内容を編集する
#       fill_in '教室名', with: ""
#       fill_in '教室の説明', with: "sampleです"
#       fill_in '郵便番号', with: ""
#       select ('---')
#       fill_in '市町村', with: ""
#       fill_in '番地', with: ""
#       fill_in '建物名', with: ""
#       fill_in '最寄り駅', with: ""
#       fill_in '駅徒歩(分)', with: ""
#       fill_in '電話番号', with: ""
#       fill_in 'メールアドレス',with: ""
#       fill_in '担当者名', with: ""
#       fill_in '営業時間', with: ""
#       fill_in '定休日', with: ""
#       fill_in 'オフィシャルサイト', with: "sample"
#       fill_in '授業料', with: ""
#       fill_in '備考', with: "sample"
#       # 送信した値がDBに保存されていないことを確認する
#       expect{
#         find('input[name="commit"]').click
#       }.not_to change { Music.count }
#       # 教室編集ページに戻る
#       visit edit_room_path(@music_genre1.music)
#       end
#       it 'ログインしているがユーザーが登録していない教室は編集できない' do
#         # 教室1を登録したユーザーでログインする
#         sign_in(@music_genre1.music)
#         # 教室一覧ページへ遷移する
#         visit rooms_path
#         # 登録していない教室を名前から詳細ページに遷移する
#         visit room_path(@music_genre2.music)
#         # 編集ページがないことを確認する
#         expect(page).to have_no_content('編集する')
#       end
#       it 'ログインしていないユーザーは教室情報を編集できない' do
#       # 教室一覧ページへ遷移する
#       visit rooms_path
#       # 登録した名前から詳細ページに遷移する
#       visit room_path(@music_genre1.music)
#       # 編集ページがないことを確認する
#       expect(page).to have_no_content('編集する')
#     end
#   end
# end

RSpec.describe '教室情報削除', type: :system do
  before do
    @music = FactoryBot.build(:music)
    @user = FactoryBot.create(:user)
    @genre = FactoryBot.create(:genre)
    @music_genre = FactoryBot.build(:music_genre)
  end
  context '教室情報編集ができるとき' do
    it 'ログインしたユーザーは自分が登録した教室情報の削除ができる' do
      # ログインする
      sign_in(@music_genre.genre)
      # 教室を掲載するページに遷移する
      visit new_music_path
      # フォームに情報を入力する
      attach_file '画像', "#{Rails.root}//public/top_image.jpg"
      fill_in '教室名', with: @music.name
      fill_in '教室の説明', with: @music.content
      check('エレキギター')
      fill_in '郵便番号', with: @music.post_code
      select ('神奈川')
      fill_in '市町村', with: @music.city
      fill_in '番地', with: @music.house_number
      fill_in '建物名', with: @music.building_name
      fill_in '最寄り駅', with: @music.station
      fill_in '駅徒歩(分)', with: @music.walk
      fill_in '電話番号', with: @music.phone_number
      fill_in 'メールアドレス', with: @music.mail
      fill_in '担当者名', with: @music.representative
      fill_in '営業時間', with: @music.hour
      fill_in '定休日', with: @music.holiday
      fill_in 'オフィシャルサイト', with: @music.url
      fill_in '授業料', with: @music.fee
      fill_in '備考', with: @music.remarks
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Music.count }.by(1)
      # トップページに遷移していることを確認する
      expect(current_path).to eq root_path
      # 教室一覧ページに遷移する
      visit rooms_path
      # 登録した名前から詳細ページに遷移する
      click_on('Otosuta教室')
      # 削除ボタンを押す
      click_on('教室情報の削除')
      # #トップページに遷移する
      visit root_path



      # ログインする
      # sign_in(@music_genre1.music)

      # # 教室一覧ページへ遷移する
      # visit rooms_path
      # # 登録した名前から詳細ページに遷移する
      # visit room_path(@music_genre1.music)
      # # 削除ボタンを押す
      # expect(page).to have_content('教室情報の削除')
      # # click_on ’教室情報の削除’
      # #トップページに遷移する
      # expect(@music_genre1).to eq root_path



      # # 教室1を登録したユーザーでログインする
      # sign_in(@music_genre1.music)
      # # 教室一覧ページへ遷移する
      # visit rooms_path
      # # 登録した名前から詳細ページに遷移する
      # visit room_path(@music_genre1.music)
      # # 削除ボタンを押す
      # expect(page).to have_content('教室情報の削除')
      # # click_on ’教室情報の削除’
      # #トップページに遷移する
      # expect(@music_genre1).to eq root_path
    end
  end
end
