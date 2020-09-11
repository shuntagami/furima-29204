FactoryBot.define do
  Faker::Config.locale = :ja
  factory :order_address do
    postal_code     { Faker::Address.postcode }
    prefecture      { id = 2 }
    city            { Faker::Address.city }
    banti           { Faker::Address.building_number }
    phone_number    { Faker::PhoneNumber.cell_phone.delete("-") }
    token           { "tok_0000000000000000000000000000" }
  end
end
