class SummaryController < ApplicationController
  def show
    @budgets = Budget.group_order
  end
end
