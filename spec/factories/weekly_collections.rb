FactoryBot.define do
  factory :weekly_collection do
    week_date { Faker::Date.between(from: 1.week.ago, to: Date.today) }
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
