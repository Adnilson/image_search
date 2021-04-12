Rails.application.routes.draw do
  root 'images#index'

  get '/search', to: 'images#search'
end
