class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :member_weekly_collections
  scope :active_and_enabled_to_pay, -> { where(active: true, enabled_to_pay: true)}
end
