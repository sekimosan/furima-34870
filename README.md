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
- has_many: orders

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
- has_one: order

## ordersテーブル

|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| user           | references| foreign_key: true |
| item           | references| foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル

|Column          |Type       |Options                       |
|----------------|-----------|------------------------------|
| postal_code    | string    | null:false                   |
| prefecture_id  | integer   | null:false                   |
| city           | string    | null:false                   |
| house_number   | string    | null:false                   |
| building       | string    |                              |
| phone_number   | string    | null:false                   |
| order          | references| null:false                   |

### Association
- belongs_to: order