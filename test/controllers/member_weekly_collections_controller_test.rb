require "test_helper"

class MemberWeeklyCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_weekly_collection = member_weekly_collections(:one)
  end

  test "should get index" do
    get member_weekly_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_member_weekly_collection_url
    assert_response :success
  end

  test "should create member_weekly_collection" do
    assert_difference("MemberWeeklyCollection.count") do
      post member_weekly_collections_url, params: { member_weekly_collection: { amount: @member_weekly_collection.amount, member_id: @member_weekly_collection.member_id, paid_date: @member_weekly_collection.paid_date, status: @member_weekly_collection.status, weekly_collection_id: @member_weekly_collection.weekly_collection_id } }
    end

    assert_redirected_to member_weekly_collection_url(MemberWeeklyCollection.last)
  end

  test "should show member_weekly_collection" do
    get member_weekly_collection_url(@member_weekly_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_weekly_collection_url(@member_weekly_collection)
    assert_response :success
  end

  test "should update member_weekly_collection" do
    patch member_weekly_collection_url(@member_weekly_collection), params: { member_weekly_collection: { amount: @member_weekly_collection.amount, member_id: @member_weekly_collection.member_id, paid_date: @member_weekly_collection.paid_date, status: @member_weekly_collection.status, weekly_collection_id: @member_weekly_collection.weekly_collection_id } }
    assert_redirected_to member_weekly_collection_url(@member_weekly_collection)
  end

  test "should destroy member_weekly_collection" do
    assert_difference("MemberWeeklyCollection.count", -1) do
      delete member_weekly_collection_url(@member_weekly_collection)
    end

    assert_redirected_to member_weekly_collections_url
  end
end
