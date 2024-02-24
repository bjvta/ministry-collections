require "test_helper"

class FeeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fee_type = fee_types(:one)
  end

  test "should get index" do
    get fee_types_url
    assert_response :success
  end

  test "should get new" do
    get new_fee_type_url
    assert_response :success
  end

  test "should create fee_type" do
    assert_difference("FeeType.count") do
      post fee_types_url, params: { fee_type: { amount: @fee_type.amount, name: @fee_type.name } }
    end

    assert_redirected_to fee_type_url(FeeType.last)
  end

  test "should show fee_type" do
    get fee_type_url(@fee_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_fee_type_url(@fee_type)
    assert_response :success
  end

  test "should update fee_type" do
    patch fee_type_url(@fee_type), params: { fee_type: { amount: @fee_type.amount, name: @fee_type.name } }
    assert_redirected_to fee_type_url(@fee_type)
  end

  test "should destroy fee_type" do
    assert_difference("FeeType.count", -1) do
      delete fee_type_url(@fee_type)
    end

    assert_redirected_to fee_types_url
  end
end
