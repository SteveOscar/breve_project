require 'test_helper'

class UserCanUploadAttachmentTest < ActionDispatch::IntegrationTest
  test "user can attach an image to a post" do

    visit new_user_post_path
    fill_in "Title", with: "My First Post"
    fill_in "Body", with: "This is a picture of something"
    click_on SOMETHING

  end
end
