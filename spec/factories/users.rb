FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password              {password}
    password_confirmation {password}
    gimei = Gimei.name
    family_name_kanji     {gimei.last.kanji}
    first_name_kanji      {gimei.first.kanji}
    family_name_kana      {gimei.last.katakana}
    first_name_kana       {gimei.first.katakana}
    birthday              {Faker::Date.between(from:'1930-01-01', to: 5.year.ago)}
  end
end