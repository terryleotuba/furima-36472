FactoryBot.define do
  factory :order_address do
      postal_code         { '123-4567' }
      prefecture_id       { Faker::Number.between(from: 1, to: 47) }
      city                { Gimei.city.kanji }
      house_number        { '1-1-1' }
      building_name       { 'テストビル' }
      phone_number        { Faker::Number.leading_zero_number(digits: 10) }
      token               { 'tok_abcdefghijk00000000000000000' }
  end
end
