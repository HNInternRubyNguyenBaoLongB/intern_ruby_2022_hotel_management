Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/baskets", to: "baskets#show"
    resources :users
    namespace :admin do
      resources :dashboard
      resources :rooms
    end
    resources :rooms
    resources :bookings
  end
end
