require 'test_helper'

class PostsHaveTagsTest < ActionDispatch::IntegrationTest
  test "the truth" do
    user = User.create(username: "Elvis", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_user_post_path(user)

    fill_in "Title", with: "My First Post"
    fill_in "Body", with: "This is a picture of something"
    check('Travel')
    click_on "Submit"
  end
end
