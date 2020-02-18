class Address < ApplicationRecord
  validates :post_code,               presence: true
  validates :prefecture,              presence: true
  validates :town,                    presence: true
  validates :address_num,             presence: true
  validates :apartment_info,          length: { minimum: 0, maximum: 100 }
  belongs_to :user, optional: true
  validates_associated :user

  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to_active_hash :prefecture
  end
end
