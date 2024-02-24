FactoryBot.define do
  factory :expense do
    description { Faker::Lorem.sentence }
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    member
  end
end
