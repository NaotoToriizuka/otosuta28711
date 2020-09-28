# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# アプリケーション名

otosuta28711

# アプリケーション概要

* 音楽教室の情報を登録、検索する
 
# URL

https://otosuta28711.herokuapp.com/
 
# テスト用アカウント
 
テストID：test
テストPASS：testtest1

# 利用方法

* トップページにて教室名のキーワードを記述をフォームに記述、もしくは「都道府県」「楽器のジャンル」を選択すれば、条件にマッチした登録された教室名が表示される。  
* 検索で表示された教室名をクリックすれば、詳細ページに遷移され教室情報を確認することができる。  
* 教室の情報を掲載するにはユーザー登録を行うとトップページに「教室を掲載する」ボタンが表示される。クリックすると教室情報を登録するページに遷移する。

* ログインしている、かつ登録した教室があれば詳細ページにて「教室情報の変更」ボタンが表示され、クリックすると編集ページに遷移し教室情報を編集することができる。

* ログインしている、かつ登録した教室があれば詳細ページにて「教室情報の削除」ボタンが表示され、クリックすると教室情報が削除され、トップページに遷移する。  

# 目指した課題解決

* 生徒側  
  * 楽器を始めたいけど何を選んだらいいか分からない  
  * 早く上達して好きな曲を弾きたいから教わりたい


* 教室経営者  
  * ホームページは作らなくてもWeb上に教室の情報を簡単に載せたい

## なぜその課題解決が必要なのか

* 生徒側  
  * 情報が記載されていれば電話や口頭などで確認せずに済むから  
  * 自宅の近くに音楽教室があれば移動の時間がかからずに済むから

* 教室経営者
  * 口頭で説明しないといけないから  
  * 1度登録すれば更新しなくても済むから

## 課題を解決する実装の内容

* 音楽教室を検索できる機能  
* 音楽教室の情報を載せる機能
 
# 洗い出した要件

| 優先順位（高：3、中：2、低：1） | 機能  | 目的 | 詳細 | ストーリー  | 見積もり（所要時間） |
| ------------------------------- | ----  | ---- | ---- | ----------- | -------------------- |
 3 | トップページ | |サインイン/ログインページと教室名、都道府県、楽器名の検索フォームがある | ログインされたアカウントはロウアウトと教室情報と登録するボタンが表示する  | 2 |
| 3 | 教室検索 | ユーザーが簡単にデータ検索出来るようにする | 条件を指定した上で教室の検索を可能にする | 教室名、都道府県、楽器名を選択すればマッチした検索ページに遷移する | 5 |
| 3 | ユーザー登録 | 教室経営者の情報を保存する  | 教室情報の登録、編集、削除を行えるようにする | 名前、メール、パスワードをフォームに入力。登録されるとトップページに遷移する | 2 |
| 3 | 教室登録  | 教室情報を登録する  | ログインしたアカウントが教室の情報を入力したら完了する | ・画像、教室名、教室の説明、楽器ジャンル、代表名、メールアドレス、電話番号、住所(郵便番号、都道府県、市町村、番地)路線最寄り駅、最寄り駅から徒歩分、営業時間、定休日、授業料、URL、備考をフォームに記述する ・正しく登録されればトップページに遷移する | 4 |
| 3  | 一覧機能     | 全ての教室の一覧を表示する | 登録されている教室名を表示する | クリックすると詳細ページに遷移 | 3 |
| 3 | 詳細機能 | 教室の詳細な情報を表示する | 選択されたら教室の情報を表示する | ・画像、教室名、教室の説明、楽器ジャンル、代表名、メールアドレス、電話番号、住所(郵便番号、都道府県、市町村、番地)路線最寄り駅、最寄り駅から徒歩分、営業時間、定休日、授業料、URL、備考が表示されている | 3 |
| 2 | 編集機能 | ログインしていて、かつ登録した教室の情報の編集を可能にする | 教室の編集機能する | ・画像、教室名、教室の説明、楽器ジャンル、代表名、メールアドレス、電話番号、住所(郵便番号、都道府県、市町村、番地)路線最寄り駅、最寄り駅から徒歩分、営業時間、定休日、授業料、URL、備考をフォームに記述する ・正しく編集されれば詳細ページに遷移する | 2 |
| 1 | 削除機能 | 教室の詳細を編集する | ログインしていて、かつ登録した教室の情報の削除を可能にする | ・編集ページにて削除ボタンをクリックしたら情報が削除され、トップページに遷移する  | 1 |

# 実装した機能についてのGIFと説明

URL貼付ける

# 実装予定の機能

* 検索機能の地域での検索では「都道府県」しか選択できないので、「都道府県」を選択したら「市町村」を選択できるように追加実装を予定

# データベース設計
![Otosuta ER](https://user-images.githubusercontent.com/68979810/93697241-7cebb900-fb50-11ea-855f-45ccc680c52a.png)

# ローカルでの動作方法

* git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

has_many :musics 

## musics テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| name           | string     | null: false                    |
| content        | text       |                                |
| representative | string     | null: false                    |
| mail           | string     | null: false, unique: true      |
| prefecture_id  | integer    | null: false                    |
| post_code      | string     | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| station        | string     | null: false                    |
| walk           | integer    | null: false                    |
| hour           | string     | null: false                    |
| holiday        | string     |                                |
| fee            | text       | null: false                    |
| url            | text       |                                |
| remarks        | text       |                                |  


### Association

belongs_to :user  
has_many :music_genres  
has_many :genres, through: :music_genres  
belongs_to_active_hash :prefecture  
has_one_attached :image  

## genres テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |  

### Association

has_many :music_genres  
has_many :musics, through: :music_genres  

## music_genres テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| music          | references | null: false, foreign_key: true |
| genre          | references | null: false, foreign_key: true |

### Association

belongs_to :music  
belongs_to :genre