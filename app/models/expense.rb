class Expense < ApplicationRecord
  validates_presence_of :member_id
  validates_presence_of :description
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  belongs_to :member
end
