require 'rails_helper'
require 'devise'

RSpec.describe 'Testing PublicRecipe#index view, it', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    sign_in @user
    @recipe = Recipe.create(name: 'Public Recipe', description: 'Test Description',
                            preparation: 10, cookingtime: 10,
                            public: true, user_id: @user.id)
    4.times do |i|
      Recipe.create(name: "Recipe ##{i}", description: "Description ##{i}",
                    preparation: 10, cookingtime: 10,
                    public: false, user_id: @user.id)
    end
    visit public_recipes_path
  end

  it 'display only the public recipe' do
    expect(page).to have_content(@recipe.name)
  end

  it 'display the public recipe description' do
    expect(page).to have_content(@recipe.description)
  end

  it 'not allow other users to remove the public recipe, if they are not the owner' do
    new_user = User.create(name: 'User Test', email: 'test@example.com', password: '234567')
    sign_in new_user
    visit public_recipes_path
  end
end
