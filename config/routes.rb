LostTribes::Application.routes.draw do
  
  devise_for :users
  resources :users
  resources :events do
    member do
      post :register
    end
  end

  root :to => "home#index"
end
