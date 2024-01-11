Rails.application.routes.draw do
  devise_for :users
  root "foods#index"
  resources :users
  resources :foods
  get 'general_shopping_list', to: 'general_shopping_list#index'
  get 'general_shopping_list' => 'general_shopping_list#index', as: 'shopping_list'


  resources :recipes
  get 'public_recipes' => 'recipes#public_recipes'

  get 'public_recipes' => 'recipes#public_recipes'
  get 'recipes/:id/add_ingredient' => 'recipe_foods#new', as:'add_recipe_food'
  resources :recipes
  # for updating the public 
  patch 'recipes/:id/toggle_public', to: 'recipes#toggle_public', as: 'toggle_public_recipe'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'recipe_foods' => 'recipe_foods#index', as:'recipe_foods'
  get 'recipe_foods/delete/:id' => 'recipe_foods#destroy', as: 'delete_recipe_food'
  post 'recipe_foods/create' => 'recipe_foods#create', as:'create_recipe_food'

  # Defines the root path route ("/")
  # root "articles#index"
end
