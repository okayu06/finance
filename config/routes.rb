Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my_portofolio', to:'users#my_portofolio'
  get 'search_stock', to:'stocks#search'
  resources :user_stocks ,only: [:create]
end
