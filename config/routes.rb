Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    patch 'dashboards/:id/toggle_suspend', to: 'dashboards#toggle_suspend', as: :toggle_suspend_admin_dashboard
  end

  namespace :admin do
    resources :posts, only: [:index] do
      member do
        patch :toggle_hidden
      end
    end
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
      post "users/guest_sign_in", to: "sessions#guest_sign_in"
    end
  end
end
