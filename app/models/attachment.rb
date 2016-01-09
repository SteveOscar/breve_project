class Attachment < ActiveRecord::Base
  belongs_to :post
  has_attached_file :image, styles: { large: "500x500", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end