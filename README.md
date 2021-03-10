## usersテーブル

|Column          |Type     |Options            |
|----------------|---------|-------------------|
| last_name      | string  | null:false        |
| first_name     | string  | null:false        |
| last_name_kana | string  | null:false        |
| first_name_kana| string  | null:false        |
| nickname       | string  | null:false        |
| email          | string  | null:false        |
|                |         | unique: true      |
| birthday       | date    | null:false        |

 ### Association
- has_many: items
- has_many: shopping_logs
- has_many: info_of_shippings

## itemsテーブル

|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| image          |           |                   |
| title          | string    | null:false        |
| price          | integer   | null:false        |
| shipping_fee   | string    | null:false        |
| item_pr        | text      | null:false        |
| user_id        | references| foreign_key :true |
| item_status    | string    | null:false        |
| shipping_area  | string    | null:false        |
| shipping_days  | string    | null:false        |

### Association
- belongs_to: user
- belongs_to: info_of_shipping
- has_one: shopping_logs

## shopping_logsテーブル

|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| user_id        | references| foreign_key: true |
| item_id        | references| foreign_key: true |

### Association
- belongs_to: user
- belongs_to: items
- belongs_to: info_of_shipping

## info_of_shippingテーブル

|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| postal_code    | integer   | null:false        |
| prefecture     | string    | null:false        |
| city           | string    | null:false        |
| address        | string    | null:false        |
| building       | string    |                   |
| phone_number   | integer   | null:false        |
|                |           | unique: true      |

### Association
- belongs_to: user
- has_many: shopping_logs
- has_many: items