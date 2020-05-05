Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create]
  	resources :book_comments, only: [:destroy]
  end
  root 'homes#index'
  get '/' => 'homes#index'
  get 'home/about' => 'homes#about', as: :about_homes
end
