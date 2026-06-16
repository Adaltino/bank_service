require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new_deposit" do
    get transactions_new_deposit_url
    assert_response :success
  end

  test "should get deposit" do
    get transactions_deposit_url
    assert_response :success
  end

  test "should get new_withdraw" do
    get transactions_new_withdraw_url
    assert_response :success
  end

  test "should get withdraw" do
    get transactions_withdraw_url
    assert_response :success
  end
end
