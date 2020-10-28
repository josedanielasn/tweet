Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :users, except: [:index, :new, :create] do
    resources :posts
    get '/follows' => 'users#follow', as: 'follow'
    patch '/newFollower' => 'users#newFollower', as:'newFollower'
  end
end
