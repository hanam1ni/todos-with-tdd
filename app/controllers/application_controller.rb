class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
    redirect_to new_session_path unless signed_in?
  end

  private

  def signed_in?
    current_user.present?
  end

  def current_user
    User.find_by(id: session[:current_user_id])
  end
end
