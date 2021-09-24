FactoryBot.define do
  factory :item do
    goods_name          { Faker::Name.initials(number: 10) }
    goods_description   { Faker::Lorem.sentence(word_count: 3) }
    price               { Faker::Number.between(from: 300, to: 9999999) }
    goods_category_id   { Faker::Number.between(from: 2, to: 11) }
    goods_status_id     { Faker::Number.between(from: 2, to: 7) }
    prefecture_id       { Faker::Number.between(from: 1, to: 47) }
    shipping_cost_id    { Faker::Number.between(from: 2, to: 3) }
    shipping_date_id    { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
