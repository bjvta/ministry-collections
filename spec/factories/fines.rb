FactoryBot.define do
  factory :fine do
    status { 0 } 
    # status { 1 } # when this is paid 
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    # paid_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }  # when this is paid

    member 
    fee_type
  end
end
