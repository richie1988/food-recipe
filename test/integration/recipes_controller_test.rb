require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
    sign_in users(:one)  # Assuming you have a fixture for users
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_url
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: @recipe.name, preparation: @recipe.preparation, cookingtime: @recipe.cookingtime, description: @recipe.description, public: @recipe.public, user_id: @recipe.user_id } }
    end

    assert_redirected_to recipe_url(Recipe.last)
  end

  # Add more tests as needed
end
