Rails.application.routes.draw do
  root to: 'entries#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :entries
  get "/archive",   to: 'entries#archive'
  get "/thisweek",  to: 'entries#thisweek'
end
