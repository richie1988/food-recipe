require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @user = User.create(email: 'test@example.com', password: 'password')
    sign_in @user
  end

  describe 'GET #index' do
    it 'responds successfully' do
      get :index
    end
  end
end
