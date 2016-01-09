ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'database_cleaner'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
DatabaseCleaner[:active_record].strategy = :truncation
# DatabaseCleaner[:sequel, {:connection => Sequel.sqlite("db/skill_inventory_test.sqlite3")}].strategy = :truncation

class Minitest::Test
  def setup
    DatabaseCleaner.start
  end
  def teardown
    DatabaseCleaner.clean
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  def delete_users
    User.all.each do |user|
      user.delete
    end
  end
  def delete_posts
    Post.all.each do |post|
      post.delete
    end
  end

  def setup
    delete_users
    delete_posts
  end
  def teardown
    reset_session!
    DatabaseCleaner.clean
  end
end
