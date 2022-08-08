Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "pages#home"
  end
end
