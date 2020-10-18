class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token
  belongs_to_active_hash :prefecture
  has_one :address
  belongs_to :item
  belongs_to :user
  
end
