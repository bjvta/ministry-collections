require 'rails_helper'

RSpec.describe "FactoryBot factories" do
  it "verifies that all factories are valid" do
    FactoryBot.lint
  end
end