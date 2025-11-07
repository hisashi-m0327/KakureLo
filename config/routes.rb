Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:index, :destroy]
  end
  
  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get "/home/about" => "homes#about", as: "about"

    resources :posts do
      resource :like, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update, :destroy]

    devise_scope :user do
      post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    end
  end
end
