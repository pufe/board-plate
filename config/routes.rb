Rails.application.routes.draw do
  root 'lobbies#list', as: :list_lobbies
  get '/lobby/:id' => 'lobbies#show', as: :show_lobby

  get '/login' => 'logins#new', as: :new_login
  post '/login' => 'logins#create', as: :create_login
end