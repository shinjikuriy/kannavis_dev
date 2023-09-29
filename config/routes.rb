Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, path: ''
  get '/kanjis/:grapheme', to: 'kanjis#show'

  # letter_opener_web
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
