FactoryBot.define do
  factory :item_order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    build { '' }
    phone { '0000000000' }
    block { '鹿児島10-8'}
    token { "tok_abcdefghijk00000000000000000" }
  end
end
