require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
    before do
      @order = FactoryBot.build(:item_order)
    end
    
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it 'buildは空でも保存できること' do
      @order.build = nil
      expect(@order).to be_valid
    end

    it 'tokenが保存されないと登録できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'prefectureが空だと保存できないこと' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityは空だと保存できない' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @order.block = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Block can't be blank")
    end
    it 'phoneが空だと保存できないこと' do
      @order.phone = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone is invalid")
    end
    it 'phoneが11桁以下だと保存できないこと' do
      @order.phone = '123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone is invalid")
    end
end
