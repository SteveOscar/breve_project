require 'test_helper'

class UserCanDeletePostTest < ActionDispatch::IntegrationTest
  require 'test_helper'

    test "logged in users can delete a post" do
      user = User.create(username: "Prince", password: "pw")
      post = Post.create(title: "Title 1", body: "Body of a post", user_id: user.id)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      visit user_post_path(user, post)

      click_on "Delete"

      refute page.has_content?("Title 1")
      assert_equal user_posts_path(user), current_path
    end


end
