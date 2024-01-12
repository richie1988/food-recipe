require 'rails_helper'
require 'devise'

RSpec.describe 'Testing Food#new view, it', type: :feature do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    sign_in @user
    visit new_user_food_path(@user)
  end

  it 'display a form to create a new food' do
    expect(page).to have_field('food_name')
    expect(page).to have_field('food_measurements')
    expect(page).to have_field('food_price')
    expect(page).to have_button('Create Food')
  end

  it 'create a new food when the form is submitted' do
    fill_in('food_name', with: 'Test Food')
    select('mg', from: 'food_measurements')
    fill_in('food_price', with: 10)
    click_button('Create Food')
    expect(page).to have_current_path(user_foods_path(@user))
    expect(page).to have_content('Test Food')
  end
end
