class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :ship_form
  belongs_to_active_hash :day

  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_one :buy

  with_options presence: true do
    validates :name
    validates :text
    validates :status_id
    validates :prefecture
    validates :category_id
    validates :day_id
    validates :ship_form_id
    validates :image
  end

  validates :category_id, :day_id, :ship_form_id, :prefecture_id, :status_id, numericality: { other_than: 1 }

  with_options presence: true, format: { with:/\A[0-9]+\z/ } do
    validates :price
  end

  validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
end
