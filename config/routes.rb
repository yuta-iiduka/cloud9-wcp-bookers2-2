Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  
  resources :users,only: [:show,:index,:edit,:update]
  resources :books,only: [:create, :index, :edit, :update, :show, :destroy] do
    resource :favorites,only: [:create, :destroy]
    resources :book_comments,only: [:create, :destroy]
  end

end 
  