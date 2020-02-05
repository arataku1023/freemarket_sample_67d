class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :nickname,                presence: true
  validates :password,                presence: true, length: {minimum: 6, maximum: 128},on: :save_to_session_before_phone
  validates :last_name,               presence: true
  validates :first_name,              presence: true
  validates :last_name_kana,          presence: true
  validates :first_name_kana,         presence: true
  # validates :birth_year,              presence: true
  # validates :birth_month,             presence: true
  # validates :birth_day,               presence: true
  has_one :address
  accepts_nested_attributes_for :address
  validates_associated :address
end
