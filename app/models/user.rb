class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :nickname,                presence: true
  validates :password,                presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone
  validates :last_name,               presence: true
  validates :first_name,              presence: true
  validates :last_name_kana,          presence: true
  validates :first_name_kana,         presence: true
  validates :birth_year,              presence: true
  validates :birth_month,             presence: true
  validates :birth_day,               presence: true
  
  has_many :items
  
  has_many :cards
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  # has_secure_password
  # extend ActiveHash::Associations::ActiveRecordExtensions do
  #   belong_to_active_hash :birth_year
  #   belong_to_active_hash :birth_month
  #   belong_to_active_hash :birth_day
  # end
  
end
