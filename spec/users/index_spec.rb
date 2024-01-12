require 'rails_helper'

RSpec.describe 'Testing User#index view, it', type: :feature do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    sign_in @user
    visit root_path
  end

  it 'should greet the user' do
    expect(page).to have_content('Welcome To our Food App')
  end
end
