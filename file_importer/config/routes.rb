Rails.application.routes.draw do
  root 'datafiles#index'
  resources :datafiles
end
