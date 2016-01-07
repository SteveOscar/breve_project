require 'test_helper'

class UserCanLogOutTest < ActionDispatch::IntegrationTest
  test "logged in user can log out" do
    user = User.create(username: "Alex", password: "password")

    visit login_path
    fill_in "Username", with: "#{user.username}"
    fill_in "Password", with: "password"
    click_button "Log In"
    click_link "Log Out"
    assert_equal login_path, current_path
  end
end
