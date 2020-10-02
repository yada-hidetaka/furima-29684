class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :buys

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with:/\A[ァ-ヶー－]+\z/, message:"" } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]+\z/, message:"" } do
    validates :first_name
    validates :last_name
  end

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6}\z/
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX, message:"" }
end
