Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
  end

  scope "(:locale)/admin", locale: /en|vi/ do
    get "/", to: "admin#index"
    get "login", to: "admin#login"
    post "/", to: "admin#index"
  end
end
