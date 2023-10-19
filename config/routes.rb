Rails.application.routes.draw do
  get '/', to: 'home#index'
  resources :warehouses, only: [:show]

end
