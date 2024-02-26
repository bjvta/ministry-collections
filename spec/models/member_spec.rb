require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "#full_name" do
    it 'should return the full name' do
      member = create(:member, first_name: 'Luis', last_name: 'Gonzalez')
      expect(member.full_name).to eq('Luis Gonzalez')
    end
  end
end
