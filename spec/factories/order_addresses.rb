FactoryBot.define do
  Faker::Config.locale = :ja
  factory :order_address do
    postal_code     { Faker::Address.postcode }
    prefecture      { Faker::Address.state }
    city            { Faker::Address.city }
    banti           { Faker::Address.building_number }
    phone_number    { Faker::PhoneNumber.cell_phone }
  end
end
