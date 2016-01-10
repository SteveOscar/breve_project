require 'test_helper'

class PostsHaveTagsTest < ActionDispatch::IntegrationTest
  test "the truth" do
    user = User.create(username: "Elvis", password: "password")
    Tag.create(name: "Travel")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_user_post_path(user)

    fill_in "Title", with: "My First Post"
    fill_in "Body", with: "This is a picture of something"
    choose('TRAVEL')
    click_on "Submit"
    assert_equal "Travel", user.posts.last.tags.last[:name]
  end
end
