FactoryBot.define do
  factory :balance do
    type_movement { 0 } # for income
    # type { 1 } # for expense
    # type { [0, 1].sample } # replace with your actual types
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    income_type { [0, 1].sample } # replace with your actual income types
    previous_balance { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    current_balance { Faker::Number.decimal(l_digits: 2, r_digits: 2) }

    member
  end
end
