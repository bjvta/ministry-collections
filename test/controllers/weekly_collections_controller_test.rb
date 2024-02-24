require "test_helper"

class WeeklyCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly_collection = weekly_collections(:one)
  end

  test "should get index" do
    get weekly_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_weekly_collection_url
    assert_response :success
  end

  test "should create weekly_collection" do
    assert_difference("WeeklyCollection.count") do
      post weekly_collections_url, params: { weekly_collection: { amount: @weekly_collection.amount, week_date: @weekly_collection.week_date } }
    end

    assert_redirected_to weekly_collection_url(WeeklyCollection.last)
  end

  test "should show weekly_collection" do
    get weekly_collection_url(@weekly_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_weekly_collection_url(@weekly_collection)
    assert_response :success
  end

  test "should update weekly_collection" do
    patch weekly_collection_url(@weekly_collection), params: { weekly_collection: { amount: @weekly_collection.amount, week_date: @weekly_collection.week_date } }
    assert_redirected_to weekly_collection_url(@weekly_collection)
  end

  test "should destroy weekly_collection" do
    assert_difference("WeeklyCollection.count", -1) do
      delete weekly_collection_url(@weekly_collection)
    end

    assert_redirected_to weekly_collections_url
  end
end
