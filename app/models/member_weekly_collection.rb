class MemberWeeklyCollection < ApplicationRecord
  belongs_to :member
  belongs_to :weekly_collection
end
