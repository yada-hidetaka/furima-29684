class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with:/\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/ } do
    validates :first_name
    validates :last_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, length: { minimum: 6 }
end