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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| lastname        | string | null: false |
| firstname       | string | null: false |
| lastname_kana   | string | null: false |
| firstname_kana  | string | null: false |
| birth_date      | date   | null: false |
 

### Association

- has_many :items
- has_many :purchased_items



## items テーブル
 
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| discription      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| charge_id        | integer    | null: false                    |
| shipping_place_id| integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association

- has_many :purchased_items
- belongs_to :user
- belongs_to_active_hash :condition
- belongs_to_active_hash :charge
- belongs_to_active_hash :shipping_place
- belongs_to_active_hash :shipping_date



## purchased_items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address




## addresses テーブル

| Column         | Type       | Options                        |
| -------------  | ---------- | ------------------------------ |
| purchased_item | references | null: false, foreign_key: true |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |

### Association

- belongs_to :purchased_item
- belongs_to_active_hash :prefecture 