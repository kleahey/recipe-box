json.extract! recipe, :id, :title, :ingredients, :directions, :created_at, :image, :updated_at
json.url recipe_url(recipe, format: :json)
