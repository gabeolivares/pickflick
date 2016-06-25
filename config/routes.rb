Rails.application.routes.draw do
  resources :movies, only: [:index, :show, :create, :destroy]
  root 'movies#index'

  post 'create_movie',       to: 'movies#create'
  delete 'destroy_movie',    to: 'movies#destroy'
  patch  'edit_movie',       to: 'movies#update'
  post 'search_movie',       to: 'movies#search'
  post 'search_imdb_movie',  to: 'movies#search_imdb'
end
