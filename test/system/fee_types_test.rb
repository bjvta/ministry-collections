require "application_system_test_case"

class FeeTypesTest < ApplicationSystemTestCase
  setup do
    @fee_type = fee_types(:one)
  end

  test "visiting the index" do
    visit fee_types_url
    assert_selector "h1", text: "Fee types"
  end

  test "should create fee type" do
    visit fee_types_url
    click_on "New fee type"

    fill_in "Amount", with: @fee_type.amount
    fill_in "Name", with: @fee_type.name
    click_on "Create Fee type"

    assert_text "Fee type was successfully created"
    click_on "Back"
  end

  test "should update Fee type" do
    visit fee_type_url(@fee_type)
    click_on "Edit this fee type", match: :first

    fill_in "Amount", with: @fee_type.amount
    fill_in "Name", with: @fee_type.name
    click_on "Update Fee type"

    assert_text "Fee type was successfully updated"
    click_on "Back"
  end

  test "should destroy Fee type" do
    visit fee_type_url(@fee_type)
    click_on "Destroy this fee type", match: :first

    assert_text "Fee type was successfully destroyed"
  end
end
