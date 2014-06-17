class Admin::BaseController < ApplicationController
  private
  def admin_required
    unless current_user.admin?
      render text: "Forbidden", layout: false, status: 403
    end
  end
end
