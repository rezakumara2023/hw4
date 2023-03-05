class SessionsController < ApplicationController
  def new
  end

  def create
    # authenticate the user
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
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
    flash["notice"] = "You are now logged out."
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  