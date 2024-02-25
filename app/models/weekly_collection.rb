class WeeklyCollection < ApplicationRecord
  validates_presence_of :week_date
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than_or_equal_to: 0    
  has_many :member_weekly_collections
end
