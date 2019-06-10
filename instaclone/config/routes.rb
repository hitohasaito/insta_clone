Rails.application.routes.draw do
  resources :instagrams do
  collection do
    post :confirm
  end
  end
  resources :users
  resources :sessions
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
