# README

## usersテーブル

| Column         | Type     | Options       |
|----------------|----------|---------------|
| nickname       | string   | null: false   |
| email          | string   | null: false   |
| password       | string   | null: false   |
| first_name     | string   | null: false   |
| last_name      | string   | null: false   |
| birthday       | date     | null: false   |
| first_name_kana| string   | null: false   |
| last_name_kana | string   | null: false   |

## Association
- has_many :items
- has_many :comments
- has_many :buys

## items テーブル

| Column      | Type     | Options          |
|-------------|----------|------------------|
| name        | string   | null: false      |
| user        |references| foreign_key: true|
| text        | text     | null: false      |
| price       | integer  | null: false      |
|category_id  | integer  | null: false      |
| status_id   | integer  | null: false      |
| cost_id     | integer  | null: false      |
| day_id      | integer  | null: false      |
| ship_form_id| integer  | null: false      |


## Association
- belongs_to :user
- has_many : comment
- has_one :buy

## comment テーブル

| Column    | Type     | Options       |
|-----------|----------|---------------|
| user_id   | integer  | null: false   |
| text      | text     | null: false   |
| item_id   | integer  | null: false   |

## Association
- belongs_to :user
- belongs_to :item

## buys テーブル

| Column    | Type     | Options          |
|-----------|----------|------------------|
| item      |references| foreign_key: true|
| user      |references| foreign_key: true|

## Association

- has_one :address
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column      | Type     | Options         |
|-------------|----------|-----------------|
| build       | string   |                 |
| buy         |references|foreign_key: true|
| phone       | string   | null: false     |
|postal_code  | string   | null: false     |
|prefecture_id| integer  | null: false     |
| city        | string   | null: false     |
| block       | string   | null: false     |


## Association

- belongs_to :buy