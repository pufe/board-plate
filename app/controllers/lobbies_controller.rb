class LobbiesController < ApplicationController
  def list
    if !logged_in?
      redirect_to new_login_path
    else
      @user_lobbies = Lobby.with_player(current_user)
      @open_lobbies = Lobby.open
      @lobby = Lobby.new
    end
  end

  def show
    @lobby = Lobby.new(lobby_params)
    if @lobby.authenticate(current_user)
      @lobby = Lobby.find(@lobby.id)
      @lobby.guests << current_user
    else
      redirect_to list_lobbies_path
    end
  end

  def lobby_params
    params.require(:lobby)
  end

  def new
  end

  def create
  end
end
