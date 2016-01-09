require 'test_helper'

class UserCanOnlySeeTheirPostsTest < ActionDispatch::IntegrationTest
  test "users can only see their posts" do
    user1 = User.create(username: "Elvis", password: "password")
    user2 = User.create(username: "Charles", password: "password")
    post1 = Post.create(title: "Something", body: "something something", user_id: user1.id)
    post2 = Post.create(title: "Another Thing", body: "more things", user_id: user2.id)

    ApplicationController.any_instance.stubs(:current_user).returns(user2)

    visit user_posts_path(user2)

    assert page.has_content?("Another Thing")
    refute page.has_content?("Something")
  end

end
