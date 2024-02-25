class FeeType < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than_or_equal_to: 0
end
