Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'homes#top'

  get "/home/about" => "homes#about", as: "about"

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

end
