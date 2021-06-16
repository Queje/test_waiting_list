Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[index new show create destroy]
  resources :waiting_list, only: %i[index show update]
end
