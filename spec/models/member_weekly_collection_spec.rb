RSpec.describe MemberWeeklyCollection, type: :model do
  describe 'associations' do
    it { should belong_to(:member) }
    it { should belong_to(:weekly_collection) }
  end
end