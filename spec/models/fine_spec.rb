require 'rails_helper'

RSpec.describe Fine, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:member_id) }
    it { should validate_presence_of(:fee_type_id) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:amount) }
  end
  describe 'associations' do
    it { should belong_to(:member) }
    it { should belong_to(:fee_type) }
  end
end
