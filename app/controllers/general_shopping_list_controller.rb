class GeneralShoppingListController < ApplicationController
  before_action :calculate_total_value_of_food_needed, only: [:index]

  def index
    @user = current_user
    @shopping_list_foods = @user.general_shopping_list
  end

  private

  def calculate_total_value_of_food_needed
    @total_value_of_food_needed = @shopping_list_foods&.sum { |food| food.price * food.quantity } || 0
  end
end
