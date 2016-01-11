class User < ActiveRecord::Base
  validates_presence_of :username
  has_many :posts
  has_secure_password

  enum role: %w(default admin)

  def generate_slug
    self.username
  end

  def to_params
    generate_slug.parameterize
  end

end
