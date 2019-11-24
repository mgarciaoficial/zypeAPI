Rails.application.routes.draw do
  resources :videos, only: [:index, :show]
  get '/', to: 'videos#index'
end
