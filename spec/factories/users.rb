FactoryBot.define do
  factory :user do
    nickname                          { Faker::Name.initials }
    email                             { Faker::Internet.free_email }
    password                          { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation             { password }
    family_name                       { Gimei.last.kanji }
    given_name                        { Gimei.first.kanji }
    family_name_reading               { Gimei.last.katakana }
    given_name_reading                { Gimei.first.katakana }
    birthday                          { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
