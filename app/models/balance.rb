class Balance < ApplicationRecord
  belongs_to :member
  validates_presence_of :type_movement
  validates_presence_of :amount
  validates_presence_of :member_id
  validates_presence_of :income_type
  validates_presence_of :previous_balance
  validates_presence_of :current_balance

  enum type_movement: { income: 0, expense: 1 }
  enum income_type: { weekly: 0, fine: 1}
end
