class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_current_season_id

  private
  def admin_required
    unless current_user.admin?
      render text: "Forbidden", layout: false, status: 403
      return
    end
  end

  def set_current_season_id
    if Season.last && session[:season_id].nil?
      session[:season_id] = Season.last.id
    end
    @season_id = session[:season_id]
  end

  def current_season
    @season_id
  end
  alias_method :cs, :current_season

  def set_budgets
    @budget_outgoings ||= Budget.season(cs).outgoings.group_order
    @budget_incomes ||= Budget.season(cs).incomes.group_order
  end

  def set_incomes
    @incomes ||= Income.season(cs)
  end

  def set_expenses
    @expenses ||= Expense.season(cs)
  end

  def set_in_out
    set_budgets
    set_incomes
    set_expenses
    @budget_in_out = @budget_incomes.sum(:amount) - @budget_outgoings.sum(:amount)
    @actual_in_out = @incomes.sum(:amount) - @expenses.sum(:amount)
  end
end
