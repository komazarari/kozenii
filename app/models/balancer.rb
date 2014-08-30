class Balancer
  attr_reader :description, :budget_id, :comment

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
    }
    Income.new(income_params)
  end

  def balance_out(description: @description,
                  budget_id: @budget_id,
                  comment: @comment)
    new_income = income(description: description, budget_id: budget_id, comment: comment)
    Expense.transaction do
      new_income.save!
      @expense.update!(status: "closed")
    end
    new_income
  rescue => e
    nil
  end
end
