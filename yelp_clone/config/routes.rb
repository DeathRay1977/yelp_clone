Rails.application.routes.draw do
  devise_for :users
  resources :restaurants

  resources :restaurants do
   resources :reviews
  end
 root to: 'restaurants#index'
end
