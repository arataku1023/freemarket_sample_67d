# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|address_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|nickname|string|null: false|             #ニックネーム
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|
|last-name|string|null: false|            #姓
|first-name|string|null: false|           #名
|last-ruby|string|null: false|            #振り仮名(姓)
|first-ruby|string|null: false|           #振り仮名(名)
|birth-year|string|null: false|           #西暦
|birth-month|string|null: false|          #月
|birth-day|string|null: false|            #日
|user-image|text||                        #プロフィール画像

### Association
- has_many :items
- has_one :address


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
|detail|text|null: false|          #商品説明
|price|string|null: false|         #値段
|status|string|null: false|        #商品の状態
|bland|string|null: false|         #ブランド名
|region|string|null: false|        #発送元地域
|arrival-date|string|null: false|  #発送日

### Association
- belongs_to :user, dependent: :user
- belongs_to :category
- has_many :images


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|last-name|string|null: false|     #姓
|first-name|string|null: false|    #名
|last-ruby|string|null: false|     #振り仮名(姓)
|first-ruby|string|null: false|    #振り仮名(名)
|post-code|string|null: false|     #郵便番号
|prefecture|string|null: false|    #都道府県
|town|string|null: false|          #市区町村
|address-num|string|null: false|   #番地

### Association
- belongs_to :user



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|item_id|integer|null: false, foreign_key: true|  

### Association
- has_many :items



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image-url|string|null: false| #写真url
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item



