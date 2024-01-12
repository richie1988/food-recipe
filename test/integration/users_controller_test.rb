require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in users(:one)  # Assuming you have a fixture for users
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: @user.name } }
    end

    assert_redirected_to user_url(User.last)
  end

  # Add more tests as needed
end
