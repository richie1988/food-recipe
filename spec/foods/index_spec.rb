require 'rails_helper'

RSpec.describe 'Testing Food#index view, it should', type: :feature do
  before do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    sign_in @user
    @food = Food.create(name: 'Test Food', measurements: 'test', price: 10, user_id: @user.id)
    5.times { |i| Food.create(name: "Food ##{i}", measurements: 'unit', price: 1, user_id: @user.id) }
  end

  it 'should display the name of each of the foods' do
    visit foods_path
    expect(page).to have_content(@food.name)
    5.times { |i| expect(page).to have_content("Food ##{i}") }
  end

  it 'display the measurement unit of the food' do
    visit foods_path
    expect(page).to have_content(@food.measurements)
  end

  it 'display the price of the food' do
    visit foods_path
    expect(page).to have_content(@food.price)
  end

  it 'navigate to a new page when the button to add a new food is clicked' do
    visit foods_path
    click_link('New food')
    expect(page).to have_current_path(new_food_path)
  end
end
