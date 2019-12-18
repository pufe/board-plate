class LoginsController < ApplicationController
  def new
    @login = Login.new
  end

  def create
    @login = Login.new(login_params)

    if @login.save
      session[:name] = @login.name
      redirect_to list_lobbies_path
    else
      @error = true
      render :new
    end
  end

  def login_params
    params.require(:login).permit(:name, :password)
  end
end
