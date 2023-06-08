Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
      get "homes/top"
      resources :post_sakes, only: [:index, :show, :destroy, :edit, :update] do
      resources :post_comments, only: [:create, :destroy]
    end
      resources :users, only: [:index, :show, :destroy, :edit, :update]
    end

  scope module: :public do
      resources :post_sakes, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resources :post_comments, only: [:create, :destroy]
    end
      resources :users
      post "users/guest_sign_in", to: "users#guest_sign_in"

      # 退会確認画面
      get "/users/:id/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
      # 論理削除用のルーティング
      patch "/users/:id/withdrawal" => "users#withdrawal", as: "withdrawal"
    end
  get "homes/top"

  root to: "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
