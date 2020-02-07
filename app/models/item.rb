class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :brand
end
