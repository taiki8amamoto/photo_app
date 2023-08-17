Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/mail_opener" if Rails.env.development?
  root 'sessions#new'
  resources :favorites, only: [:index, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
