![Gravy Logo](https://user-images.githubusercontent.com/74521093/105895448-e036ac00-6058-11eb-87f9-494ca7686e31.png)


### About Gravy (グレイビーについて)
グレイビー(Gravy)はC2Cのフードデリバリーを実現するためのプラットフォームです。
  
※実取引は不可能です

## URL (本番環境)
http://18.180.105.125/

## 🌐 Demonstration (デモ)


## 🌝 What brought me to make this app


## 💫 Functions
- deviseを用いたユーザー新規登録とログイン
- cancancanを用いた管理者権限の付与
- rails_adminを用いた管理者ページ作成及び商品登録
- カート機能
- 非同期通信による商品お気に入り機能
- 非同期通信による商品へのコメント機能
- gretelを用いたパンくずリスト
- PAY.JPを用いたクレジットカードの登録及び購入処理
- RSpecを使ったモデルの単体テストコード
- capistranoによるAWS EC2への自動デプロイ

## 🙌 Check It on Local
```
$ git clone 
$ cd gravy-32310
$ bundle install
```

商品一覧、商品詳細、商品検索についてはログインなしで使用可能です。  
商品の購入/カート機能には、新規登録/ログイン、マイページ(my account)でのクレジットカードの登録及び送付先住所の登録が必要です。  
ログインにあたっては、以下の登録済みアカウントをご利用いただけます。  
- email           :
- password        :

また、クレジットカードについては、以下のテストカードをご利用ください。  
※ご自身のカードは使用しないで下さい。  

- number          : 4242424242424242
- expiration date : 01/23
- cvc             : 123

## 💡 Supplementary information
- Ruby 2.5.1
- Ruby on Rails 5.2.4.2

## 👀 E-R Diagram


## 📙 Features
## Home

## Index of dishes

## Detail of a dish

## Cart

## Log in (User)

## Sign up (User)

## Log in (Chef)

## Sign up (Chef)


## My Account

## Favorite

## Registration of an address

## Registration of a credit card

## Confirmation before payment

## Completion of Purchasing

## Purchase history

## Details of purchase history

## Index page for chef

## Registration of dishes (Chef)


# Database

## users table

|Column |Type |Options |
|-------|-----|--------|
| nickname        | string      | null: false                     |
| email           | string      | null: false, uniqueness: true   |
| password        | string      | null: false                     |
| zip_code        | string      | null: false                     |
| prefecture_id   | integer     | null: false                     |
| district        | string      | null: false                     |
| street          | string      | null: false                     |
| phone_number    | string      | null: false                     |

### Association
- has_many :orders
- has_many :dishes, through: :orders

## chefs table

|Column |Type |Options |
|-------|-----|--------|
| name           | string      | null: false                    |
| email          | string      | null: false, uniqueness: true  |
| password       | string      | null: false                    |
| zip_code       | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| district       | string      | null: false                    |
| street         | string      | null: false                    |
| phone_number   | string      | null: false                    |

### Association
- has_many :dishes
- has_one :profile

## profiles table

| about               | text        |                                |
| business_hour_begin | time        | null: false                    |
| business_hour_end   | time        | null: false                    |
| status_id           | integer     | null: false                    |
| gender_id           | integer     | null: false                    |
| age_id              | integer     | null: false                    |
| genre_id            | integer     | null: false                    |
| chef                | references  | null: false, foreign_key: true |

### Association
- belongs_to :chef

## dishes table

|Column |Type |Options |
|-------|-----|--------|
| name        | string      | null: false                    |
| about       | text        |                                |
| ready_id    | integer     | null: false                    |
| price       | integer     | null: false                    |
| chef        | references  | null: false, foreign_key: true |


### Association
- belongs_to :chef
- has_many :orders
- has_many :users, through: :orders
- has_many :dish_tag_relations
- has_many :tags, through: :dish_tag_relations

## orders table

|Column |Type |Options |
|-------|-----|--------|
| user   | references   | null: false, foreign_key: true |
| dish   | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :dish

## tags table

|Column |Type |Options |
|-------|-----|--------|
| name        | string      | null: false, uniqueness: true  |

### Association
- has_many :dish_tag_relations
- has_many :dishes, through: :dish_tag_relations


