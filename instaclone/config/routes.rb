Rails.application.routes.draw do
  resources :instagrams
  resources :users
  resources :sessions
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
