class IncomesController < ApplicationController
  before_action :admin_required, except: [:index, :show]
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @q = Income.search(params[:q])
    @incomes = @q.result.desc.page params[:page]
  end

  def show
  end

  def edit
  end

  def new
    @income = if params[:income]
                Income.new(income_params)
              else
                Income.new
              end
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      flash[:notice] = "Successfully created."
    end
    respond_with(@income, location: incomes_url)
  end

  def update
    if @income.update(income_params)
      flash[:notice] = "Successfully updated."
    end
    respond_with(@income, location: incomes_url)
  end

  def destroy
    @income.destroy
    flash[:notice] = "Deleted."
    respond_with(@income, location: incomes_url)
  end

  private
  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:obtained_date,
                                   :amount,
                                   :description,
                                   :member_id,
                                   :budget_id,
                                   :comment)
  end
end
