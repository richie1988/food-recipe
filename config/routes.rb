Rails.application.routes.draw do
  devise_for :users
  root "foods#index"
  resources :users
  resources :foods
  get 'general_shopping_list', to: 'general_shopping_list#index'


  resources :recipes
  get 'public_recipes' => 'recipes#public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
