class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :category, presence: true

  has_attached_file :image, styles: { medium: "500x350#", thumb: "300x200#"}, default_url: "default_image.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :user_id, presence: true

  def self.search params
    recipes = Recipe.where(category_id: params[:category].to_i) unless params[:category].blank?
    recipes
  end
end
