class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
    redirect_to new_session_path unless signed_in?
  end

  private

  def signed_in?
    session[:current_email].present?
  end
end
