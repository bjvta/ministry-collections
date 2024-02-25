class Balance < ApplicationRecord
  belongs_to :member
  validates_presence_of :type
  validates_presence_of :amount
  validates_presence_of :member_id
  validates_presence_of :income_type
  validates_presence_of :previous_balance
  validates_presence_of :current_balance
end
