class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
  end
end
