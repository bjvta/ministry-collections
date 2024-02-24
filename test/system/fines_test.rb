require "application_system_test_case"

class FinesTest < ApplicationSystemTestCase
  setup do
    @fine = fines(:one)
  end

  test "visiting the index" do
    visit fines_url
    assert_selector "h1", text: "Fines"
  end

  test "should create fine" do
    visit fines_url
    click_on "New fine"

    fill_in "Amount", with: @fine.amount
    fill_in "Fee type", with: @fine.fee_type_id
    fill_in "Member", with: @fine.member_id
    fill_in "Paid date", with: @fine.paid_date
    fill_in "Status", with: @fine.status
    click_on "Create Fine"

    assert_text "Fine was successfully created"
    click_on "Back"
  end

  test "should update Fine" do
    visit fine_url(@fine)
    click_on "Edit this fine", match: :first

    fill_in "Amount", with: @fine.amount
    fill_in "Fee type", with: @fine.fee_type_id
    fill_in "Member", with: @fine.member_id
    fill_in "Paid date", with: @fine.paid_date
    fill_in "Status", with: @fine.status
    click_on "Update Fine"

    assert_text "Fine was successfully updated"
    click_on "Back"
  end

  test "should destroy Fine" do
    visit fine_url(@fine)
    click_on "Destroy this fine", match: :first

    assert_text "Fine was successfully destroyed"
  end
end
