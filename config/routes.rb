Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :users, except: [:index, :new, :create] do
    resources :posts
  end
end
