class SummaryController < ApplicationController
  def show
    @outgoings = Budget.outgoings.group_order
    @incomes = Budget.incomes.group_order
  end
end
