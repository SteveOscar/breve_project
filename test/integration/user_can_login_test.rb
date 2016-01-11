require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "registered user can log in" do
    user = User.create(username: "Brenna", password: "password")
    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    within('.main') do
      click_on "Log In"
    end

    assert_equal user_path(user), current_path
    assert page.has_content?("Welcome, Brenna!")
  end
end
