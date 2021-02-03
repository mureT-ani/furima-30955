FactoryBot.define do
  factory :item do
    name               {Faker::Commerce.product_name}
    explanation        {Faker::Lorem.sentence}
    price              {Faker::Number.between(from: 300, to: 9999999)}
    area_id            {Faker::Number.between(from: 2, to: 48)}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    days_id            {Faker::Number.between(from: 2, to: 4)}
    fee_id             {Faker::Number.between(from: 2, to: 3)}
    status_id          {Faker::Number.between(from: 2, to: 7)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end