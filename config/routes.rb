Rails.application.routes.draw do
  get 'users/update'

  root to: 'static#index'

  resource :sessions, only: [:create]
  scope :auth do
    match ':provider/callback', to: 'sessions#create', via: [:get, :post]
    #match 'failure', to: redirect('/'), via: [:get, :post]
    #match ':provider/failure' => 'home#login', via: [:get, :post]
  end

  resources :users, only: [:update] do

    scope module: 'users' do
      resource :setup, only: [:new, :create]
    end
  end
end
