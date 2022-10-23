Rails.application.routes.draw do
  devise_for :users

  root to: "gru#index"
  resources :gru
end
