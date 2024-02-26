class MemberWeeklyCollection < ApplicationRecord
  include MarkAsPaid

  belongs_to :member
  belongs_to :weekly_collection
  enum status: { unpaid: 0, paid: 1 }

  def week_date
    weekly_collection.week_date
  end

  def member_name
    member.full_name
  end
end
