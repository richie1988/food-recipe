require 'rails_helper'
RSpec.describe 'Testing Recipe#show view', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    sign_in @user
    @recipe = Recipe.create(name: 'Test Recipe', description: 'Test Description',
                            preparation: 10, cookingtime: 10,
                            public: true, user_id: @user.id)
    visit recipe_path(@recipe)
  end

  it 'displays the name of the recipe' do
    expect(page).to have_content(@recipe.name)
  end

  it 'displays the description of the recipe' do
    expect(page).to have_content(@recipe.description)
  end

  it 'displays the preparation time of the recipe' do
    expect(page).to have_content(@recipe.preparation)
  end

  it 'displays the cooking time of the recipe' do
    expect(page).to have_content(@recipe.cookingtime)
  end

  it 'displays a link to generate a shopping list' do
    expect(page).to have_link('Generate Shopping List', href: shopping_list_path)
  end

  it 'displays a link to add ingredients if the current user is the recipe owner' do
    expect(page).to have_link('Add Ingredients', href: add_recipe_food_path)
  end
  it 'allows the user to add ingredients to a recipe' do
    visit add_recipe_food_path(@recipe)
    food = Food.create(name: 'Test Food', price: 5)
  
    select food.name, from: 'Food'
    fill_in 'Quantity', with: 2
  
    click_button 'Add Ingredient'
    expect(page).to have_content('Ingredient is successfully created.')
    expect(@recipe.recipe_foods.find_by(food_id: food.id).quantity).to eq(2)
  end
end
