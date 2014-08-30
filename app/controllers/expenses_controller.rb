class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy, :comments, :new_balancer, :balanced_out]
  respond_to :html, :json

  def index
    @expenses = Expense.all
  end

  def show
  end

  def edit
  end

  def new
    @expense = if params[:expense]
                 Expense.new(expense_params)
               else
                 Expense.new
               end
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:notice] = "Successfully created."
    end
    respond_with(@expense, location: expenses_url)
  end

 def update
    if @expense.update(expense_params)
      flash[:notice] = "Successfully updated."
    end
    respond_with(@expense, location: expenses_url)
  end

  def destroy
    @expense.destroy
    flash[:notice] = "Deleted."
    respond_with(@expense, location: expenses_url)
  end

  def update_comments
    @expense = Expense.find(params[:expense_id])
    @expense.comments.build(comment_params)
    @expense.save
  end

  def comments
    render template: 'expenses/_comments', layout: false
  end

  def new_balancer
    @balancer = Balancer.new(@expense)
    @income = @balancer.income
  end

  def balanced_out
    @balancer = Balancer.new(@expense)
    balancer_params
    new_income = @balancer.balance_out(description: balancer_params[:description],
                                       budget_id: balancer_params[:budget_id],
                                       comment: balancer_params[:comment])
    respond_to do |format|
      if new_income
        format.html { redirect_to(expense_url(@expense), notice: "Expense/Income were successfully updated.\nSee #{view_context.link_to('New Item', income_path(new_income))}".html_safe) }
      else
        flash[:alert] = "Sorry, error occurred on updating states. Rollbacked."
        format.html { render action: 'show' }
      end
    end
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
                                    :budget_id,
                                    :status,
                                    :user_note,
                                    :status)
  end

  def balancer_params
    params.require(:balancer).permit(:description,
                                     :budget_id,
                                     :comment)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
