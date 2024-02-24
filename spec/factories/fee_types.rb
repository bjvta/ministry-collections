FactoryBot.define do
  factory :fee_type do
    name { Faker::Commerce.product_name }
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
