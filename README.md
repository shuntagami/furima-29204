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

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| kanjiname  | string | null: false |
| kananame   | string | null: false |
| birth_date | integer| null: false |
 

### Association

- has_many :items
- has_many :purchased_items
- has_many :messages



## items テーブル
 
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| image          | string     | null: false                    |
| name           | string     | null: false                    |
| discription    | text       | null: fals                     |
| condition      | string     | null: false                    |
| charge         | string     | null: false                    |
| shipping_place | string     | null: false                    |
| shipping_date  | sring      | null: false                    |
| price          | integer    | null: false                    |

### Association

- has_many :purchased_items
- belongs_to :users



## purchased_items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :adresses




## adresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| purchased_item_id | references | null: false, foreign_key: true |
| postal_code       | integer    | null: false                    |
| prefecture        | string     | null: false                    |
| city              | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | integer    | null: false                    |

### Association

- belongs_to :purchased_items