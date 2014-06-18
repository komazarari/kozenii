class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private
  def admin_required
    unless current_user.admin?
      render text: "Forbidden", layout: false, status: 403
    end
  end
end
