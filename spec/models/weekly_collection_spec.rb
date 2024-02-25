require 'rails_helper'

RSpec.describe WeeklyCollection, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:week_date) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end
end
