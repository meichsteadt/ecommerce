Rails.application.routes.draw do
  root to: "home#index"
  get '/contact', to: "home#show"
  get '/stripe', to: "charges#show"
  resources :charges, :products, :orders, :order_items, :categories, :searches, :users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resource :cart, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
