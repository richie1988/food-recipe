require 'test_helper'

class RecipeFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_food = recipe_foods(:one)
    sign_in users(:one)  # Assuming you have a fixture for users
  end

  test "should get index" do
    get recipe_foods_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_food_url
    assert_response :success
  end

  test "should create recipe_food" do
    assert_difference('RecipeFood.count') do
      post recipe_foods_url, params: { recipe_food: { quantity: @recipe_food.quantity, recipe_id: @recipe_food.recipe_id, food_id: @recipe_food.food_id } }
    end

    assert_redirected_to recipes_url
  end

  # Add more tests as needed
end
