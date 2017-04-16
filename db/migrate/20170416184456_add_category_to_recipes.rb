class AddCategoryToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :category_id, :int
  end
end
