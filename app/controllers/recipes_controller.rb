class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { flash[:success] = "Your recipe was added successfully!" }
        format.json { render :show, status: :created, location: @recipe }
        redirect_to @recipe
      else
        format.html { flash[:alert] = "Your recipe could not be created. Please check the form and try again." }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { flash[:success] = "Your recipe was updated successfully!" }
        format.json { render :show, status: :ok, location: @recipe }
        redirect_to @recipe
      else
        format.html { flash[:alert] = "Your recipe could not be updated. Please check the form and try again." }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
        format.html { render :edit }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { flash[:success] = "Your recipe was deleted successfully." }
      format.json { head :no_content }
      redirect_to recipes_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :directions, :image)
    end
end
