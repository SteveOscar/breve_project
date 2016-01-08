require 'test_helper'

class LoggedInUserCanSeeIndividualPostTest < ActionDispatch::IntegrationTest
  test "user can see individual post" do
    user = User.create(username: "Elvis", password: "password")
    post1 = Post.create(title: "Something", body: "something something", user_id: user.id)
    post2 = Post.create(title: "Another Thing", body: "more things", user_id: user.id)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit user_posts_path(user)

    click_on post2.title
    assert_equal user_post_path(user, post2), current_path
    assert page.has_content?("Another Thing")

  end
end
