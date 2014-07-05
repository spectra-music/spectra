Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: 'home#index'
  get 'import', to: 'import#index'
  get 'import/add', to: 'import#add'

  resources :settings, except: [:edit, :new], param: :var

  resources :artists, only: [:index, :show, :update]

  resources :genres, only: [:index, :show]

  resources :albums, only: [:index, :show, :update]

  resources :tracks, except: [:edit, :new] do
    member do
      get :data
    end
  end

  resources :flexlists, except: [:edit, :new]

  resources :playlists, except: [:edit, :new]
end
