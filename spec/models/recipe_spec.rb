require 'rails_helper'
require 'devise'
RSpec.describe Recipe, type: :model do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(email: 'sadaf@example.com', password: 'password')
    @recipe = Recipe.new(
      name: 'Potato',
      preparation: 10,
      cookingtime: 20,
      description: 'Boil the potato',
      public: true,
      user: @user
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@recipe).to be_valid
    end

    it 'is not valid without a name' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a preparation time' do
      @recipe.preparation = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid with a non-positive preparation time' do
      @recipe.preparation = -1
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a cooking time' do
      @recipe.cooking = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid with a non-positive cooking time' do
      @recipe.cookingtime = -1
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a public' do
      @recipe.public = nil
      expect(@recipe).to_not be_valid
    end
  end
end
