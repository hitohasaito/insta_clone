Rails.application.routes.draw do
  resources :instagrams
  resources :users
  resources :sessions
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
