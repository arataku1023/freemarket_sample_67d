class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {uniqueness: { case_sensitive: false }}


  
  has_many :items
  has_many :comments
  has_many :cards
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  extend ActiveHash::Associations::ActiveRecordExtensions do
    belong_to_active_hash :birth_year
    belong_to_active_hash :birth_month
    belong_to_active_hash :birth_day
  end
  
end
