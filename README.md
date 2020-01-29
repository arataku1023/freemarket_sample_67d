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
|nickname|string|null: false|             #ニックネーム
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|
|last_name|string|null: false|            #姓
|first_name|string|null: false|           #名
|last_ruby|string|null: false|            #振り仮名(姓)
|first_ruby|string|null: false|           #振り仮名(名)
|birth_year|string|null: false|           #西暦
|birth_month|string|null: false|          #月
|birth_day|string|null: false|            #日

### Association
- has_many :items
- has_one :address
- has_one :image


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
|detail|text|null: false|          #商品説明
|price|string|null: false|         #値段
|status|string|null: false|        #商品の状態
|region|string|null: false|        #発送元地域
|arrival_date|string|null: false|  #発送日

### Association
- belongs_to :user, dependent: :user
- belongs_to :category
- belongs_to :second_category
- belongs_to :third_category
- has_many :images
- has_one :brand


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|    #商品用の写真URL
|item_id|integer|null: false, foreign_key: true|   

### Association
- belongs_to :item        #商品画像
- belongs_to :user        #プロフィール画像



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|last_name|string|null: false|     #姓
|first_name|string|null: false|    #名
|last_ruby|string|null: false|     #振り仮名(姓)
|first_ruby|string|null: false|    #振り仮名(名)
|post_code|string|null: false|     #郵便番号
|prefecture|string|null: false|    #都道府県
|town|string|null: false|          #市区町村
|address_num|string|null: false|   #番地
|apartment_info|string||           #マンション名やビル名、その部屋番号
|recipient_num|string||            #お届け先の電話番号

### Association
- belongs_to :user


## brandsテーブル
|Column|Type|Options|  
|------|----|-------|
|name|string|null: false, unique: true|  
|item_id|integer|null: false, foreign_key: true|  

### Association
- belongs_to :item


## cardsテーブル
|Column|Type|Options|  
|------|----|-------|
|card_id|string|null: false, unique: true|  
|security_id|string|null: false| 
|expire_month|integer|null: false| 
|expire_year|integer|null: false| 
|user_id|integer|null: false, foreign_key: true|  

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|  
|------|----|-------|
|name|string|null: false, unique: true|  
|item_id|integer|null: false, foreign_key: true|  

### Association
- has_many :items
- has_many :second_categories


## second_categoriesテーブル
|Column|Type|Options|  
|------|----|-------|
|name|string|null: false, unique: true|  
|item_id|integer|null: false, foreign_key: true|  
|category_id|integer|null: false, foreign_key: true|

### Association
- has_many :items
- has_many :third_categories
- belongs_to :category 


## third_categoriesテーブル
|Column|Type|Options|  
|------|----|-------|
|name|string|null: false, unique: true|  
|item_id|integer|null: false, foreign_key: true|  
|second_category_id|integer|null: false, foreign_key: true| 

### Association
- has_many :items
- belongs_to :second_category 

