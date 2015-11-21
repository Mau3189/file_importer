Rails.application.routes.draw do
  resources :records
  root 'datafiles#index'
  resources :datafiles
end
