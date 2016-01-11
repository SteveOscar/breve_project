class User < ActiveRecord::Base
  before_create :generate_slug
  validates_presence_of :username
  has_many :posts
  has_secure_password

  enum role: %w(default admin)

  def generate_slug
    self.slug = username.parameterize
  end

  def to_param
    slug
  end

end
