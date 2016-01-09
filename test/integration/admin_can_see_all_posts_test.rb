require 'test_helper'

class AdminCanSeeAllPostsTest < ActionDispatch::IntegrationTest
  
  test "logged in admin sees all posts" do
    admin = User.create(username: "Admin", password: "password", role: 1)
    user1 = User.create(username: "Jenney", password: "password")
    user2 = User.create(username: "Katy", password: "password")
    post1 = user1.posts.create(title: "User Post", body: "ADMIN POST VIEWING")
    post2 = user2.posts.create(title: "Coffee Thing", body: "MORE ADMIN POST VIEWING")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_posts_path
    assert page.has_content?("All Posts")
    assert page.has_content?("User Post")
    assert page.has_content?("Coffee Thing")
    assert page.has_content?("Jenny")
    assert page.has_content?("Katy")
  end
end
