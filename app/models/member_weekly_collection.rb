class MemberWeeklyCollection < ApplicationRecord
  include MarkAsPaid

  belongs_to :member
  belongs_to :weekly_collection
  enum status: { unpaid: 0, paid: 1 }
end
