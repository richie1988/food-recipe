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

  it 'displays the preparation time of the recipe' do
    expect(page).to have_content(@recipe.preparation)
  end

  it 'displays the cooking time of the recipe' do
    expect(page).to have_content(@recipe.cookingtime)
  end

  it 'displays a link to generate a shopping list' do
    expect(page).to have_link('Generate Shopping List', href: shopping_list_path)
  end
end
