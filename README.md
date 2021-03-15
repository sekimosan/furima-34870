## usersテーブル

|Column                 |Type     |Options                      |
|-----------------------|---------|-----------------------------|
| last_name             | string  | null:false                  |
| first_name            | string  | null:false                  |
| last_name_kana        | string  | null:false                  |
| first_name_kana       | string  | null:false                  |
| nickname              | string  | null:false                  |
| email                 | string  | null:false,unique: true     |
| birthday              | date    | null:false                  |
| encrypted_password    | string  | null:false                  |

 ### Association
- has_many: items
- has_many: shopping_logs

## itemsテーブル

|Column             |Type       |Options                   |
|-------------------|-----------|--------------------------|
| image             |           | ActiveStorageを用いて実装  |
| title             | string    | null:false               |
| price             | integer   | null:false               |
| shipping_fee_id   | integer   | null:false               |
| item_pr           | text      | null:false               |
| user              | references| foreign_key: true        |
| item_status_id    | integer   | null:false               |
| prefecture_id     | integer   | null:false               |
| shipping_day_id   | integer   | null:false               |
| category_id       | integer   | null:false               |

### Association
- belongs_to: user
- has_one: shopping_log

## shopping_logsテーブル

|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| user           | references| foreign_key: true |
| item           | references| foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- has_one: info_of_shipping

## info_of_shippingテーブル

|Column          |Type       |Options                       |
|----------------|-----------|------------------------------|
| postal_code    | string    | null:false                   |
| prefecture_id  | integer   | null:false                   |
| city           | string    | null:false                   |
| address        | string    | null:false                   |
| building       | string    |                              |
| phone_number   | string    | null:false                   |
| shopping_log   | references| null:false                   |

### Association
- belongs_to: shopping_log