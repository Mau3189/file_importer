Rails.application.routes.draw do
  get 'static_pages/landing'
  root 'static_pages#landing'

  resources :data_files do
    member { get :records }
  end

  resources :records do
    collection { post :import }
  end
end
