class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :nickname,                presence: true
  validates :password,                presence: true, length: {minimum: 7, maximum: 128}
  validates :last_name,               presence: true,format: /\A[一-龥ぁ-ん]/
  validates :first_name,              presence: true,format: /\A[一-龥ぁ-ん]/
  validates :last_name_kana,          presence: true,format: /\A[ァ-ヶー－]+\z/
  validates :first_name_kana,         presence: true,format: /\A[ァ-ヶー－]+\z/
  validates :birth_year,              presence: true
  validates :birth_month,             presence: true
  validates :birth_day,               presence: true

  
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :favorites
  has_many :fav_items, through: :favorites, source: :item
  # has_secure_password
  # extend ActiveHash::Associations::ActiveRecordExtensions do
  #   belong_to_active_hash :birth_year
  #   belong_to_active_hash :birth_month
  #   belong_to_active_hash :birth_day
  # end
  extend ActiveHash::Associations::ActiveRecordExtensions do
    belong_to_active_hash :birth_year
    belong_to_active_hash :birth_month
    belong_to_active_hash :birth_day
  end
  
end
