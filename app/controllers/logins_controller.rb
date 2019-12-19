class LoginsController < ApplicationController
  def new
    @login = Login.new
  end

  def create
    @login = Login.new(login_params)

    if @login.save
      session[:name] = @login.name
      session[:due_date] = Time.zone.now + 1.day
      redirect_to list_lobbies_path
    else
      @error = true
      render :new
    end
  end

  def login_params
    params.require(:login).permit(:name, :password)
  end

  def logout
    session[:name] = nil
    session[:due_date] = nil
    redirect_to new_login_path
  end
end
