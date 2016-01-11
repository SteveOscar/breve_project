class User < ActiveRecord::Base
  validates_presence_of :username
  has_many :posts
  has_secure_password

  enum role: %w(default admin)

  def generate_slug
    slug = current_user.name
  end

  def to_params
    slug.parameterize
  end

end
