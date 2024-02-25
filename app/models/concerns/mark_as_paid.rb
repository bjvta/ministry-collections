module MarkAsPaid
  extend ActiveSupport::Concern
  included do
    
  end

  def pay!
    self.status = "paid"
    self.paid_date = Time.zone.now
    self.save
    Balances::InsertRow.new(self).perform
  end
end