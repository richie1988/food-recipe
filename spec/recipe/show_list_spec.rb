require 'rails_helper'
require 'devise'

RSpec.describe 'Testing Recipe#show view, it', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    sign_in @user
    @recipe = Recipe.create(name: 'Test Recipe', description: 'Test Description',
                            preparation: 10, cookingtime: 10,
                            public: false, user_id: @user.id)
    visit recipe_path(@recipe)
  end

  it 'should display the name of the recipe' do
    visit recipe_path(@recipe)
    expect(page).to have_content(@recipe.name)
  end

  it 'should display the preparation time of the recipe' do
    visit recipe_path(@recipe)
    expect(page).to have_content(@recipe.preparation)
  end

  it 'should display the cooking time of the recipe' do
    visit recipe_path(@recipe)
    expect(page).to have_content(@recipe.cookingtime)
  end
end
