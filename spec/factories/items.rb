FactoryBot.define do
  factory :item do
    name                   {Faker::Name.initials(number: 2)}
    description          {Faker::Lorem.sentence}
    category_id             {id = 2}
    condition_id            {id = 2}
    charge_id               {id = 2}
    prefecture_id           {id = 2}
    shipping_date_id        {id = 2}
    price                   {10000}
    association :user
  end
end