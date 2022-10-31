Rails.application.routes.draw do
  devise_for :users

  root to: "gru#index"
  resources :gru do
    collection do
      post ":id/pagamento", to: "gru#pagamento", as: :pagamento
    end
  end
end
