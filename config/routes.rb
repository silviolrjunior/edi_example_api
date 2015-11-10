Rails.application.routes.draw do
  namespace :api do
    resources :products
    resources :storages
    resources :shipments
  end
  resource :xml
end
