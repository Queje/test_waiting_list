Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[index new create destroy]
  resources :waiting_list, only: %i[show update]
end
