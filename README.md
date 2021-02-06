## users テーブル

|Column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false              |
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|family_name_kanji |string |null: false              |
|first_name_kanji  |string |null: false              |
|family_name_kana  |string |null: false              |
|first_name_kana   |string |null: false              |
|birthday          |date   |null: false              |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

|Column     |Type   |Options                       |
|-----------|-------|------------------------------|
|name       |string |null: false                   |
|explanation|text   |null: false                   |
|category_id|integer|null: false                   |
|status_id  |integer|null: false                   |
|fee_id     |integer|null: false                   |
|area_id    |integer|null: false                   |
|days_id    |integer|null: false                   |
|price      |integer|null: false                   |
|user_id    |integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one    :purchase_record

## purchase_records テーブル

|Column |Type   |Options                       |
|-------|-------|------------------------------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one    :place

## places テーブル

|Column            |Type   |Options                       |
|------------------|-------|------------------------------|
|postal_number     |string |null: false                   |
|area_id           |integer|null: false                   |
|city              |string |null: false                   |
|house_number      |string |null: false                   |
|building_name     |string |                              |
|phone_number      |string |null: false                   |
|purchase_record_id|integer|null: false, foreign_key: true|


### Association
- belongs_to : purchase_record