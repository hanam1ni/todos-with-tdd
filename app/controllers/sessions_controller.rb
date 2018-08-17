class SessionsController < ApplicationController
  def new; end

  def create
    sign_in_as user_params[:email]

    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(:email)
  end

  def sign_in_as(email)
    session[:current_user_id] = User.find_or_create_by(email: email).id
  end
end