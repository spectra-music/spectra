Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
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

  resources :flexlists

  resources :playlists
end
