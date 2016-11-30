Rails.application.routes.draw do
  resources :products do
    post 'buy', on: :collection
  end

  root 'products#index'
end
