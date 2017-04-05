class RemoveFieldFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :main_image, :string
    remove_column :recipes, :thumb_image, :string
  end
end
