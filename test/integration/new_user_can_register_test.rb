require 'test_helper'

class NewUserCanRegisterTest < ActionDispatch::IntegrationTest
  test "new user can login" do
    visit new_user_path
    fill_in "Username", with: "Brenna"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Create Account"
    user = User.last

    assert_equal user_path(user), current_path
    assert page.has_content?("#{user.username}")

  end
end
