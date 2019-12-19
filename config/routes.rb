Rails.application.routes.draw do
  root 'lobbies#list', as: :list_lobbies
  post '/lobby/:id' => 'lobbies#show', as: :enter_lobby
  get '/lobby/:id' => 'lobbies#show', as: :show_lobby
  get '/lobby/new' => 'lobbies#new', as: :new_lobby
  post '/lobby/new' => 'lobbies#create', as: :create_lobby

  get '/login' => 'logins#new', as: :new_login
  post '/login' => 'logins#create', as: :create_login
  post '/logout' => 'logins#logout', as: :logout
end
