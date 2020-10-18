class ItemOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :build, :phone, :token, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :token
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :block
  end



  def save
    # binding.pry
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(phone: phone, prefecture_id: prefecture_id, city: city, postal_code: postal_code, build: build, block: block, order_id: order.id)
  end

end