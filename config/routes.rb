Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/baskets", to: "baskets#show"
    post "/payment", to: "payment#create"
    resources :users
    namespace :admin do
      resources :dashboard
      resources :rooms
      resources :bills do
        resources :bookings, only: :index
      end
    end
    resources :rooms
    resources :bookings
    resources :baskets
  end
end
