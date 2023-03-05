class SessionsController < ApplicationController
  def new
  end

  def create
    # authenticate the user
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if @user["password"] == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome, #{@user["first_name"]} you are logged in."
        redirect_to "/places"
      else
        flash["notice"] = "Nope., please enter the right password"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/sessions/new"
    end
  end

  def destroy
  end
end
  