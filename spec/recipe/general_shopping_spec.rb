# spec/features/shopping_list_spec.rb
require 'rails_helper'

RSpec.feature "ShoppingList", type: :feature do
  let(:food1) { create(:food, name: 'Apple', price: 1, quantity: 2, measurements: 'kg') }
  let(:food2) { create(:food, name: 'Banana', price: 2, quantity: 3, measurements: 'kg') }

  before do
    @shopping_list_foods = [food1, food2]
    @total_value_of_food_needed = @shopping_list_foods.sum { |food| food.price * food.quantity }
    visit shopping_list_path
  end

  scenario "user sees the correct shopping list information" do
    expect(page).to have_content('Amount of food to buy: 2')
    expect(page).to have_content("Total value of food needed: $#{@total_value_of_food_needed}")

    within("#shopping-list") do
      @shopping_list_foods.each do |food|
        expect(page).to have_content(food.name)
        expect(page).to have_content("#{food.quantity} #{food.measurements}")
        expect(page).to have_content("$#{food.price * food.quantity}")
      end
    end
  end

  scenario "user sees 'No items in the shopping list' when the list is empty" do
    @shopping_list_foods.clear
    visit shopping_list_path
    expect(page).to have_content('No items in the shopping list')
  end
end