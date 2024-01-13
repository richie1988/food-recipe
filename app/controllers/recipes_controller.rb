class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[show public_recipes]

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
    @food = Food.all
  end

  def public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
    @recipe_foods = RecipeFood.includes([:food]).all
  end

  def new
    @recipe = Recipe.new
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)

    redirect_to recipe_path(@recipe)
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation, :cookingtime, :description,
                                   :public).merge(user_id: current_user.id)
  end
end
