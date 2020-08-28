FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { 'a1' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    birth_date            {"1930-01-01"}
    
    gimei = Gimei.name
    lastname              {gimei.last.kanji}
    firstname             {gimei.first.kanji}
    lastname_kana         {gimei.last.katakana}
    firstname_kana        {gimei.first.katakana}
  end
end