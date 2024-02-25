FactoryBot.define do
  factory :member_weekly_collection do
    member
    weekly_collection
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    status { "unpaid" }    
  end
end
