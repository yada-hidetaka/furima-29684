FactoryBot.define do
  factory :item do
    name { 'test' }
    text { 'test' }
    status_id { 2 }
    prefecture_id { 2 }
    category_id { 2 }
    day_id { 2 }
    ship_form_id { 2 }
    price { 1000 }
    association :user
  end
end
