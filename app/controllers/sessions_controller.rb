class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_or_create_by(user_params)
    session[:current_user] = user

    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(:email)
  end
end