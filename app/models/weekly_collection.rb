class WeeklyCollection < ApplicationRecord
  validates_presence_of :week_date
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than_or_equal_to: 0    
  has_many :member_weekly_collections

  after_create :create_member_weekly_collections

  private

  def create_member_weekly_collections
    members = Member.active_and_enabled_to_pay
    Members::CreateWeeklyCollectionData.new(self, members).call
  end
end
