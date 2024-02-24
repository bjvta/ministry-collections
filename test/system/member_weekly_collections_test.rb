require "application_system_test_case"

class MemberWeeklyCollectionsTest < ApplicationSystemTestCase
  setup do
    @member_weekly_collection = member_weekly_collections(:one)
  end

  test "visiting the index" do
    visit member_weekly_collections_url
    assert_selector "h1", text: "Member weekly collections"
  end

  test "should create member weekly collection" do
    visit member_weekly_collections_url
    click_on "New member weekly collection"

    fill_in "Amount", with: @member_weekly_collection.amount
    fill_in "Member", with: @member_weekly_collection.member_id
    fill_in "Paid date", with: @member_weekly_collection.paid_date
    fill_in "Status", with: @member_weekly_collection.status
    fill_in "Weekly collection", with: @member_weekly_collection.weekly_collection_id
    click_on "Create Member weekly collection"

    assert_text "Member weekly collection was successfully created"
    click_on "Back"
  end

  test "should update Member weekly collection" do
    visit member_weekly_collection_url(@member_weekly_collection)
    click_on "Edit this member weekly collection", match: :first

    fill_in "Amount", with: @member_weekly_collection.amount
    fill_in "Member", with: @member_weekly_collection.member_id
    fill_in "Paid date", with: @member_weekly_collection.paid_date
    fill_in "Status", with: @member_weekly_collection.status
    fill_in "Weekly collection", with: @member_weekly_collection.weekly_collection_id
    click_on "Update Member weekly collection"

    assert_text "Member weekly collection was successfully updated"
    click_on "Back"
  end

  test "should destroy Member weekly collection" do
    visit member_weekly_collection_url(@member_weekly_collection)
    click_on "Destroy this member weekly collection", match: :first

    assert_text "Member weekly collection was successfully destroyed"
  end
end
