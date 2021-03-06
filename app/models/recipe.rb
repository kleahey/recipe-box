class Recipe < ApplicationRecord
  belongs_to :user
  
  has_attached_file :image, styles: { medium: "500x350#", thumb: "300x200#"}, default_url: "default_image.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :user_id, presence: true
end
