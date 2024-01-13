# spec/models/food_spec.rb
require 'rails_helper'
require 'devise'

RSpec.describe Food, type: :model do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    food = Food.new(name: 'Potato', measurements: 'kg', price: 2, user: @user)
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(measurements: 'kg', price: 2, user: @user)
    expect(food).to_not be_valid
  end

  it 'is not valid without measurements' do
    food = Food.new(name: 'Potato', price: 2, user: @user)
    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(name: 'Potato', measurements: 'kg', user: @user)
    expect(food).to_not be_valid
  end
end
