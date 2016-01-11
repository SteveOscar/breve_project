class Post < ActiveRecord::Base
  before_create :generate_slug
  belongs_to :user
  has_many :posts_tags
  # has_many :attachments
  has_many :tags, through: :posts_tags
  has_attached_file :image, styles: { large: "500x500", medium: "300x300>", thumb: "100x100>" }, default_url: "default_image.jpg"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def generate_slug
    self.slug = title.parameterize
  end

  def to_param
    slug
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(id: name) }
    self.tags = new_or_found_tags
  end

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end
end
