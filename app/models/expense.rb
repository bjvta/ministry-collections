class Expense < ApplicationRecord
  validates_presence_of :member_id
  validates_presence_of :description
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  belongs_to :member

  after_create :insert_into_balance

  private

  def insert_into_balance
    Balances::InsertRow.new(self).perform
  end
end
