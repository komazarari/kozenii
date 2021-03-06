class Admin::BudgetsController < Admin::BaseController
  before_action :admin_required
  before_action :set_budget, only: [:show, :edit, :update, :destroy]
  before_action :set_groups, only: [:new, :edit]
  respond_to :html, :json

  def index
    @budgets = Budget.season(cs).all
  end

  def show
  end

  def new
    @budget = Budget.new
  end

  def edit
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      flash[:notice] = "Successfully created."
    end
    respond_with(@budget, location: admin_budgets_url)
  end

  def update
    if @budget.update(budget_params)
      flash[:notice] = "Successfully updated."
    end
    respond_with(@budget, location: admin_budgets_url)
  end

  def destroy
    @budget.destroy
    flash[:notice] = "Deleted."
    respond_with(@budget, location: admin_budgets_url)
  end

  private
  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:title, :amount, :group_id, :section, :default_income, :default_outgoing, :season_id)
  end

  def set_groups
    @groups = Group.season(cs).order(:show_order)
  end
end
