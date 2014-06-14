class IncomesController < ApplicationController
  before_action :set_income, only: [:show]
  respond_to :html, :json

  def index
    @incomes = Income.all
  end

  def show
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

  private
  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:obtained_date,
                                   :amount,
                                   :description,
                                   :member_id,
                                   :comment)
  end
end
