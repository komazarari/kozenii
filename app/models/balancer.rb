class Balancer
  attr_reader :description, :budget_id, :comment, :expense_budget_id

  def initialize(expense)
    @expense = expense
    @description = "#{I18n.t(:balance_out)}: expense##{@expense.id} #{@expense.description}"
    @budget_id = Budget.default_income.try(:id)
    @comment = ''
  end

  def income(description: @description,
                  budget_id: @budget_id,
                  comment: @comment)
    income_params = {
      obtained_date: Time.now,
      amount: @expense.amount,
      description: description,
      budget_id: budget_id,
      member_id: @expense.member_id,
      comment: comment,
      season_id: @expense.season_id,
    }
    Income.new(income_params)
  end

  def balance_out(description: @description,
                  budget_id: @budget_id,
                  comment: @comment,
                  expense_budget_id: @expense.budget_id)
    new_income = income(description: description, budget_id: budget_id, comment: comment)
    Expense.transaction do
      new_income.save!
      @expense.update!(status: "closed", budget_id: expense_budget_id)
    end
    new_income
  rescue => e
    nil
  end
end
