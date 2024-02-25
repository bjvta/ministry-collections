class Fine < ApplicationRecord
  include MarkAsPaid
  
  validates_presence_of :member_id
  validates_presence_of :amount
  validates_presence_of :status
  validates_presence_of :fee_type_id
  belongs_to :member
  belongs_to :fee_type

  enum status: { unpaid: 0, paid: 1 }
end
