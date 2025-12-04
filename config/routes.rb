Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root 'users#index'
    resources :users, only: [:show, :update]
    resources :posts, only: [:index, :show, :update]
    resources :post_comments, only: [:show, :update]
  end

  
  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get "/home/about" => "homes#about", as: "about"
    get "search", to: "searchs#search"

    resources :posts do
      resource :like, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        get :followings, :followers
      end
      resource :relationships, only: [:create, :destroy] do
        collection do
          get :index
        end
      end
    end

    resources :rooms, only: [:index, :create, :show] do
      resources :messages, only: [:create]
    end

    devise_scope :user do
      post "users/guest_sign_in", to: "sessions#guest_sign_in"
    end

    get "map", to: "maps#index"
  end
end
