require "test_helper"

class FinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fine = fines(:one)
  end

  test "should get index" do
    get fines_url
    assert_response :success
  end

  test "should get new" do
    get new_fine_url
    assert_response :success
  end

  test "should create fine" do
    assert_difference("Fine.count") do
      post fines_url, params: { fine: { amount: @fine.amount, fee_type_id: @fine.fee_type_id, member_id: @fine.member_id, paid_date: @fine.paid_date, status: @fine.status } }
    end

    assert_redirected_to fine_url(Fine.last)
  end

  test "should show fine" do
    get fine_url(@fine)
    assert_response :success
  end

  test "should get edit" do
    get edit_fine_url(@fine)
    assert_response :success
  end

  test "should update fine" do
    patch fine_url(@fine), params: { fine: { amount: @fine.amount, fee_type_id: @fine.fee_type_id, member_id: @fine.member_id, paid_date: @fine.paid_date, status: @fine.status } }
    assert_redirected_to fine_url(@fine)
  end

  test "should destroy fine" do
    assert_difference("Fine.count", -1) do
      delete fine_url(@fine)
    end

    assert_redirected_to fines_url
  end
end
