# require 'test_helper'
#
# class UserCanUploadAttachmentTest < ActionDispatch::IntegrationTest
#   test "user can attach an image to a post" do
#     user1 = User.create(username: "Elvis", password: "password")
#     ApplicationController.any_instance.stubs(:current_user).returns(user1)
#
#     visit new_user_post_path user1
#     fill_in "Title", with: "My First Post"
#     fill_in "Body", with: "This is a picture of something"
#     save_and_open_page
#     fill_in "Image", with: './images/1.png'
#     click_on "Submit"
#
#   end
# end
