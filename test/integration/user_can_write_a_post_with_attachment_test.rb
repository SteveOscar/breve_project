require 'test_helper'

class UserCanWriteAPostWithAttachmentTest < ActionDispatch::IntegrationTest
  test "user_creates_a_post_with_an_attachment" do
    user = User.create(username: "Elvis", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_user_post_path(user)

    fill_in "Title", with: "My First Post"
    fill_in "Body", with: "This is a picture of something"
    click_on "Submit"

    assert_equal 
  end
end
