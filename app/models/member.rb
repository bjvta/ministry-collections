class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :balances
  has_many :member_weekly_collections
  has_many :fines
  scope :active_and_enabled_to_pay, -> { where(active: true, enabled_to_pay: true)}

  def full_name
    first_name + ' ' + last_name
  end

  def deb_weekly_collections
    member_weekly_collections.unpaid.sum(:amount)
  end

  def deb_fines
    fines.unpaid.sum(:amount)
  end

  def debt_amount
    deb_weekly_collections + deb_fines
  end
end
