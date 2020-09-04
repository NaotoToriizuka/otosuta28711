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
| genre_id       | integer    | null: false                    |
| representative | string     | null: false                    |
| mail           | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| post_code      | string     | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| station        | string     | null: false                    |
| walk           | integer    | null: false                    |
| hour           | string     |                                |
| holiday        | string     |                                |
| fee            | text       | null: false                    |
| url            | text       |                                |
| remarks        | text       |                                |

### Association

belongs_to :user