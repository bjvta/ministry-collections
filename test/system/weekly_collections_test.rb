require "application_system_test_case"

class WeeklyCollectionsTest < ApplicationSystemTestCase
  setup do
    @weekly_collection = weekly_collections(:one)
  end

  test "visiting the index" do
    visit weekly_collections_url
    assert_selector "h1", text: "Weekly collections"
  end

  test "should create weekly collection" do
    visit weekly_collections_url
    click_on "New weekly collection"

    fill_in "Amount", with: @weekly_collection.amount
    fill_in "Week date", with: @weekly_collection.week_date
    click_on "Create Weekly collection"

    assert_text "Weekly collection was successfully created"
    click_on "Back"
  end

  test "should update Weekly collection" do
    visit weekly_collection_url(@weekly_collection)
    click_on "Edit this weekly collection", match: :first

    fill_in "Amount", with: @weekly_collection.amount
    fill_in "Week date", with: @weekly_collection.week_date
    click_on "Update Weekly collection"

    assert_text "Weekly collection was successfully updated"
    click_on "Back"
  end

  test "should destroy Weekly collection" do
    visit weekly_collection_url(@weekly_collection)
    click_on "Destroy this weekly collection", match: :first

    assert_text "Weekly collection was successfully destroyed"
  end
end
