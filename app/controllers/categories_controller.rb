class CategoriesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order(name: :asc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Your category was added successfully!" }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { redirect_to categories_path, notice: "Your recipe could not be created. Please check the form and try again." }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
         if @category.update(recipe_params)
            format.html { redirect_to @category, notice: 'Category was successfully updated.' }
            format.json { render :show, status: :ok, location: @category }
         else
            format.html { render :edit }
            format.json { render json: @category.errors, status: :unprocessable_entity }
         end
      end
  end

  def destroy
    @category.destroy
         respond_to do |format|
         format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
         format.json { head :no_content }
      end
  end

  private

  def set_recipe
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:id, :name)
  end

end
