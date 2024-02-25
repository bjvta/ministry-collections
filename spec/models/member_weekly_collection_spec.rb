RSpec.describe MemberWeeklyCollection, type: :model do
  describe 'associations' do
    it { should belong_to(:member) }
    it { should belong_to(:weekly_collection) }
  end

  describe "#pay" do
    it "should update the status to paid" do
      member_weekly_collection = create(:member_weekly_collection)
      expect {
        member_weekly_collection.pay!
      }.to change(Balance, :count).by(1)
      expect(member_weekly_collection.status).to eq("paid")
    end
  end
end