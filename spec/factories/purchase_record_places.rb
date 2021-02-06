FactoryBot.define do
  factory :purchase_record_place do
    postal_number         { '123-4567' }
    area_id               { Faker::Number.between(from: 2, to: 48) }
    city                  { Faker::Address.city }
    house_number          { Faker::Address.street_address }
    building_name         { Faker::Address.secondary_address }
    phone_number          { Faker::Number.leading_zero_number(digits: 11)}
    token                 { "tok_abcdefghijk00000000000000000" }
  end
end
