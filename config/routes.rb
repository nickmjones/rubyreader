Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :entries
  get "/archive", to: 'entries#archive'
  root to: 'entries#index'
end
