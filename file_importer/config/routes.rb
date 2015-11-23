Rails.application.routes.draw do
  resources :records
  root 'datafiles#index'
  resources :datafiles do
    member { get :records }
  end
end
