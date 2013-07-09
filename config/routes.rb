LostTribes::Application.routes.draw do
  
  devise_for :users
  resources :users
  resources :events, only: [:new, :create, :index, :destroy, :show, :edit, :update]


  root :to => "home#index"
end
