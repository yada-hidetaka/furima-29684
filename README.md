# README

## usersテーブル

| Column    | Type     | Options       |
|-----------|----------|---------------|
| nickname  | string   | null: false   |
| email     | string   | null: false   |
| password  | string   | null: false   |
| first-name| string   | null: false   |
| last-name | string   | null: false   |
| birthday  | date     | null: false   |
| FIRST_NAME| string   | null: false   |
| LAST_NAME | string   | null: false   |

## Association
- has_many :items
- has_many :comments
- has_one :buy

## items テーブル

| Column    | Type     | Options          |
|-----------|----------|------------------|
| name      | string   | null: false      |
| user_id   | reference| foreign_key: true|
| text      | text     | null: false      |
| price     | integer  | null: false      |
| category  | integer  | null: false      |
| status    | integer  | null: false      |
| cost      | integer  | null: false      |
| day       | integer  | null: false      |


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

## buys テーブル

| Column    | Type     | Options       |
|-----------|----------|---------------|
| item_id   | integer  | null: false   |
| user_id   | integer  | null: false   |

## Association

- has_one :address
- belongs_to :item

## addresses テーブル

| Column    | Type     | Options       |
|-----------|----------|---------------|
| build     | string   | null: true    |
| buy_id    | integer  | null: false   |
| phone     | integer  | null: false   |
|postal_code| integer  | null: false   |
| prefecture| integer  | null: false   |
| city      | string   | null: false   |
| block     | string   | null: false   |


## Association

- belongs_to :buy