# README

![Gravy Logo](https://user-images.githubusercontent.com/74521093/101759428-ef9b7d80-3b1c-11eb-8a33-33b97be09ede.png)

# Gravy

# About

## URL

# Accounts for Test

# Usage

# Major Functions

# Database

## users table

|Column |Type |Options |
|-------|-----|--------|
| nickname        | string      | null: false                 |
| email           | string      | null: false, uniqueness: true   |
| password        | string      | null: false                 |
| zip_code        | string      | null: false                 |
| prefecture_id   | integer     | null: false                 |
| district        | string      | null: false                 |
| street          | string      | null: false                 |
| phone_number    | string      | null: false                 |

### Association
- has_many :orders

## chefs table

|Column |Type |Options |
|-------|-----|--------|
| name           | string      | null: false                    |
| about          | text        | null: false                    |
| business_hour  | string      | null: false                    |
| status_id      | integer     | null: false                    |
| gender_id      | integer     | null: false                    |
| age_id         | integer     | null: false                    |
| genre_id       | integer     | null: false                    |
| zip_code       | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| district       | string      | null: false                    |
| street         | string      | null: false                    |
| phone_number   | string      | null: false                    |


### Association
- has_many :dishes

## dishes table

|Column |Type |Options |
|-------|-----|--------|
| name        | string      | null: false                    |
| price       | string      | null: false                    |
| chef        | references  | null: false, foreign_key: true |


### Association
- belongs_to :chef
- has_one :order
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




# Check It on Local

