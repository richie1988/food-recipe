# spec/features/shopping_list_spec.rb
require 'rails_helper'

RSpec.feature 'ShoppingList', type: :feature do
  let(:food1) { create(:food, name: 'Apple', price: 1, quantity: 2, measurements: 'kg') }
  let(:food2) { create(:food, name: 'Banana', price: 2, quantity: 3, measurements: 'kg') }

  before do
    @shopping_list_foods = [food1, food2]
    @total_value_of_food_needed = @shopping_list_foods.sum { |food| food.price * food.quantity }
    visit shopping_list_path
  end
end
