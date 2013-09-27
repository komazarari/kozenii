class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show]

  def index
    @expenses = Expense.all
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  private
  def set_expense
    @expense = Expense.find(params[:id])
  end
end
