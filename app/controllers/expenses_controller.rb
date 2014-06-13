class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show]
  respond_to :html, :json

  def index
    @expenses = Expense.all
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:notice] = "Successfully created."
    end
    respond_with(@expense, location: expenses_url)
  end

  private
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:used_date,
                                    :amount,
                                    :description,
                                    :member_id,
                                    :comment,
                                    :status)
  end
end
