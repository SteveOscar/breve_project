require 'test_helper'

class UserCanEditPostTest < ActionDispatch::IntegrationTest
  test "logged in users can edit a post" do
    user = User.create(username: "Prince", password: "pw")
    post = Post.create(title: "Title 1", body: "Body of a post", user_id: user.id)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_post_path(post.user, post)

    click_on "Edit"
    fill_in "Title", with: "Edited Title"
    click_on "Submit"

    assert page.has_content?("Edited Title")
  end
end
