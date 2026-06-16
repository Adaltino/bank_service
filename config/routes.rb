Rails.application.routes.draw do
  root "accounts#show"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  resource :account, only: [ :show ]
  resource :card, only: [ :create ]

  get "/deposit", to: "transactions#new_deposit"
  post "/deposit", to: "transactions#deposit"
  get "/withdraw", to: "transactions#new_withdraw"
  post "/withdraw", to: "transactions#withdraw"

  namespace :api do
    namespace :v1 do
      resources :cards, only: [] do
        collection do
          post :validate
        end
      end

      resources :transactions, only: [] do
        collection do
          post :debit
          post :credit
        end
      end
    end
  end

  resource :pix,
    only: [],
    controller: :pix do
    collection do
      get :new
      post :validate
      post :pay
    end
  end
end
