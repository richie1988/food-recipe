class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @shopping_list_foods = @user.general_shopping_list
  end

  private

  def total_value_of_food_needed
    @shopping_list_foods.sum { |food| food.price * food.quantity }
  end
end
