require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    sign_in @user
  end

  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'responds successfully' do
      get :show, params: { id: @user.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'responds successfully' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'responds successfully' do
      get :edit, params: { id: @user.id }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    it 'updates a user' do
      patch :update, params: { id: @user.id, user: { name: 'Updated User' } }
      @user.reload
      expect(@user.name).to eq('Updated User')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a user' do
      expect do
        delete :destroy, params: { id: @user.id }
      end.to change(User, :count).by(-1)
    end
  end
end
