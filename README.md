# README

## usersテーブル

| Column    | Type     | Options       |
|-----------|----------|---------------|
| nickname  | string   | null: false   |
| email     | string   | null: false   |
| password  | string   | null: false   |
| first-name| string   | null: false   |
| last-name | string   | null: false   |
| birthday  | string   | null: false   |

## Association
- has_many :items
- has_many :comments

## items テーブル

| Column    | Type     | Options       |
|-----------|----------|---------------|
| name      | string   | null: false   |
| user_id   | integer  | null: false   |
| text      | text     | null: false   |
| image     | boolean  | null: false   |
| price     | integer  | null: false   |
| category  | string   | null: false   |
| status    | string   | null: false   |
| cost      | integer  | null: false   |
| day       | string   | null: false   |


## Association
- belongs_to :user
- has_many : comment
- has_one : address 
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

## buy テーブル

| Column    | Type     | Options       |
|-----------|----------|---------------|
| credit    | string   | null: false   |
| limit     | string   | null: false   |
| code      | string   | null: false   |
| item_id   | integer  | null: false   |

## Association

- has_one :address
- belongs_to :item

## address テーブル

| Column    | Type     | Options       |
|-----------|----------|---------------|
| build     | string   | null: false   |
| buy_id    | integer  | null: false   |
| phone     | string   | null: false   |
|postal_code| string   | null: false   |
| prefecture| string   | null: false   |
| city      | string   | null: false   |
| block     | string   | null: false   |
| item_id   | integer  | null: false   |


## Association

- belongs_to :buy
- belongs_to :item