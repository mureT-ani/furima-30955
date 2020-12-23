## users テーブル

|Column  |Type  |Options                  |
|--------|------|-------------------------|
|nickname|string|null: false              |
|email   |string|null: false, unique: true|
|password|string|null: false              |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

|Column     |Type   |Options                       |
|-----------|-------|------------------------------|
|name       |string |null: false                   |
|explanation|text   |null: false                   |
|category   |string |null: false                   |
|status     |string |null: false                   |
|fee        |integer|null: false                   |
|area       |string |null: false                   |
|days       |integer|null: false                   |
|price      |integer|null: false                   |
|user_id    |integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

|Column |Type   |Options                       |
|-------|-------|------------------------------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :place

## places テーブル

|Column            |Type   |Options                       |
|------------------|-------|------------------------------|
|post_number       |integer|null: false                   |
|prefecture        |string |null: false                   |
|city              |string |null: false                   |
|house_number      |integer|null: false                   |
|phone_number      |integer|null: false                   |
|purchase_number_id|integer|null: false, foreign_key: true|


### Association
- belongs_to : purchase_record