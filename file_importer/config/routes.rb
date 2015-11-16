Rails.application.routes.draw do
  get 'static_pages/landing'
  root 'static_pages#landing'

  resources :data_files
end
