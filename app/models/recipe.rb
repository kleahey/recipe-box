class Recipe < ApplicationRecord
  has_attached_file :image, styles: { medium: "500x350#", thumb: "300x200#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user

  validates :user_id, presence: true
end
