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
|email|string|null: false,unique: true|   #Eメール
|encrypted_password|string|null: false|   #パスワード
|last_name|string|null: false|            #姓
|first_name|string|null: false|           #名
|last_name_kana|string|null: false|       #振り仮名(姓)
|first_name_kana|string|null: false|      #振り仮名(名)
|birth_year|string|null: false|           #西暦
|birth_month|string|null: false|          #月
|birth_day|string|null: false|            #日
|image|text||                             #プロフィール写真

### Association
- has_many :items, dependent: :destroy
- has_one :address, dependent: :destroy


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|                           #商品名
|detail|text|null: false|                           #商品説明
|price|integer|null: false|                         #値段
|status|integer|null: false,limit: 1|               #商品の状態
|prefecture_id|integer|null: false|                 #発送元地域 (都道府県=>active_hash)
|arrival_date|integer|null: false|                  #発送日
|mail|string|null: false, index: true|              #発送負担
|mail_way|string|null: false, index: true|          #発送方法
|sold_status|integer||                              #購入の有無
|buyer_id|bigint||                                  #購入者のid
|user_id|bigint|null: false, foreign_key: true|     #出品者のid
|category_id|bigint|null: false, foreign_key: true| #カテゴリーのid
|brand_id|bigint|foreign_key: true|                 #ブランドのid

### Association
- belongs_to :user
- belongs_to :category
- has_many :images
- belongs_to :brand


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|                   #商品用の写真URL
|item_id|bigint|null: false, foreign_key: true|  #商品のid

### Association
- belongs_to :item



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|       #姓
|first_name|string|null: false|      #名
|last_name_kana|string|null: false|  #振り仮名(姓)
|first_name_kana|string|null: false| #振り仮名(名)
|post_code|string|null: false|       #郵便番号
|prefectures|string|null: false|     #都道府県
|town|string|null: false|            #市区町村
|address_num|string|null: false|     #番地
|apartment_info|string||             #マンション名やビル名、その部屋番号
|phone_num|string||              #お届け先の電話番号
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|  #ブランドの名前

### Association
- has_many :items


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|                    #カードのナンバー
|customer_id|string|null: false|                #payjpに登録される顧客id
|user_id|bigint|null: false, foreign_key: true| #購入者のid

### Association
- belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true| #カテゴリーの名前
|ancestry|string|null: false|           #ancestryの親子孫の番号

### Association
- has_ancentry 
- has_many :items


## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true| #ユーザーのid
|item_id|bigint|null: false, foreign_key: true| #商品のid

### Association
- belongs_to :user
- belongs_to :item


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||                       #コメントのテキスト
|item_id|bigint|foreign_key: true| #商品のid
|user_id|bigint|foreign_key: true| #ユーザーのid

### Association
- belongs_to :item
- belongs_to :user