class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :arrival_date
    belongs_to_active_hash :postage
  end
  validates :name,              presence: true, length: { maximum: 40 }
  validates :detail,            presence: true, length: { maximum: 1000 }
  validates :price,             presence: true, inclusion: 300..9999999
  validates :status,            presence: true
  validates :mail,              presence: true
  validates :mail_way,          presence: true
  validates :user_id,           presence: true
  validates :category_id,       presence: true
  validates :arrival_date_id,   presence: true
  validates :prefecture_id,     presence: true

  belongs_to :user

  belongs_to :category

  has_many :favorites
  has_many :users, through: :favorites

  # belongs_to :brand ←後日実装の予定

  enum status:{nothing: "", intact: 0, clean: 1, good: 2, scratched: 3, bad: 4, dirty: 5}
end 
