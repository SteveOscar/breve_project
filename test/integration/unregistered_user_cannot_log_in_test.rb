require 'test_helper'

class UnregisteredUserCannotLogInTest < ActionDispatch::IntegrationTest
  test "unregistered user gets error message on login attempt" do
    visit login_path
    fill_in "Username", with: "Brenna"
    fill_in "Password", with: "password"

    within('.main') do
      click_on "Log In"
    end

    assert page.has_content?("Invalid username or password")
  end
end
