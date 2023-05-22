Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get 'my_portfolio' , to: 'users#my_portfolio'
  # Defines the root path route ("/")
  # root "articles#index"
  
  get 'search_stock' , to: 'stocks#search'

  # get 'search_stock' , to: 'stocks#search', :defaults => { :format => 'js' }
  
end
 