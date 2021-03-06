class Address < ApplicationRecord
  validates :phone_num,               length: {maximum: 11 }
  validates :post_code,               presence: true, length: {is: 7}
  validates :prefectures,              presence: true
  validates :town,                    presence: true
  validates :address_num,             presence: true
  validates :apartment_info,          length: { minimum: 0, maximum: 100 }
  belongs_to :user, optional: true
  validates_associated :user

  # extend ActiveHash::Associations::ActiveRecordExtensions 
  # belongs_to_active_hash :prefecture
end
