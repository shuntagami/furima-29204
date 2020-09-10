FactoryBot.define do
  factory :order_address do
    postal_code { '鈴木' }
    shipping_place { 'スズキ' }
    city     { 'suzuki' }
    banti { '123-4567' }
    phone_number { 1 }
  end
end
