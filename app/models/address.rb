class Address < ApplicationRecord
  validates :phone_num,               length: {maximum: 11 }
  belongs_to :user, optional: true
  validates_associated :user

  # extend ActiveHash::Associations::ActiveRecordExtensions 
  # belongs_to_active_hash :prefecture
end
