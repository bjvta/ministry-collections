require "rails_helper"

RSpec.describe Balances::InsertRow do
  describe "#perform" do
    it "inserts a row when it's a expense" do
      create(:balance)
      expense = create(:expense, amount: 1000)
      expect {
        described_class.new(expense).perform
      }.to change { Balance.count }.by(1)
      last_balance = Balance.last
      expect(last_balance.previous_balance).to be > last_balance.current_balance
    end

    it "inserts a row when it's a fine" do
    end
    it "inserts a row when it's an income with member_weekly_collection" do
    end
  end
end
