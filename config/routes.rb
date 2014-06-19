Rails.application.routes.draw do

  root to: 'home#index'
  get 'import', to: 'import#index'
  get 'import/add', to: 'import#add'

  resources :settings, except: [:edit, :new], param: :var

  resources :artists, only: [:index, :show, :update]

  resources :genres, only: [:index, :show]

  resources :albums, only: [:index, :show, :update]

  resources :tracks do
    member do
      get :data
    end
  end
end
