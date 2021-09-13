# テーブル設計

## users テーブル

| Column               | Type     | Options                   |
| -------------------- | -------- | ------------------------- |
| nickname             | string   | null: false               |
| email                | string   | null: false, unique: true |
| encrypted_password   | string   | null: false               |
| family_name          | string   | null: false               |
| given_name           | string   | null: false               |
| family_name_reading  | string   | null: false               |
| given_name_reading   | string   | null: false               |
| birthday             | date     | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| goods_name        | string     | null: false                    |
| goods_description | text       | null: false                    |
| goods_category_id | integer    | null: false                    |
| goods_status_id   | integer    | null: false                    |
| shipping_cost_id  | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| shipping_date_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### 備考
goods_image       : ActiveStorageで実装するため、デーブルに記載されません。
goods_category    : ActiveHashを用います。そのためのinteger型です。
goods_status      : ActiveHashを用います。そのためのinteger型です。
shipping_cost     : ActiveHashを用います。そのためのinteger型です。
shipping_area     : ActiveHashを用います。そのためのinteger型です。
shipping_date     : ActiveHashを用います。そのためのinteger型です。

### Association

- belongs_to :user
- has_many   :comments
- has_one    :order

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### 備考

クレジットカード情報についてはPAY.JPでトークン発行のため、ER図/デーブルに記載されません。

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### 備考
prefecture: ActiveHashを用います。そのためのinteger型です。

### Association

- belongs_to :order