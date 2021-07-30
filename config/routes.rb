Rails.application.routes.draw do
  root to: "homes#index"
  resources :user_accounts do
    member do
      patch :change_status
    end
  end
  devise_for :users
end
