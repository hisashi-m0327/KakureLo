Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about", as: "about"

  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :index, :show, :destroy, :edit]

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

end
