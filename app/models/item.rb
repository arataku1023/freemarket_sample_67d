class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :arrival_date
    belongs_to_active_hash :postage
  end

  has_many :images

  belongs_to :user
  belongs_to :category
  belongs_to :brand

  enum status:{nothing: "", intact: 0, clean: 1, good: 2, scratched: 3, bad: 4, dirty: 5}
end 
