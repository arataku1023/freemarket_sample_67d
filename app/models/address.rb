class Address < ApplicationRecord
  validates :post_code,               presence: true
  validates :prefecture,              presence: true
  validates :town,                    presence: true
  validates :address_num,             presence: true
  validates :apartment_info,          presence: true
  belongs_to :user, optional: true

end
