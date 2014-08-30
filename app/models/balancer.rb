class Balancer
  def initialize(expense)
    @expense = expense
    @desc = "#{I18n.t(:balance_out)}: expense##{@expense.id} #{@expense.description}"
  end

  def balance_out(desc: @desc,
                  budget: Budget.default_income,
                  comment: '')
    params = {
      obtained_date: Time.now,
      amount: @expense.amount,
      description: desc,
      budget_id: budget,
      comment: comment,
    }
    @income = Income.new(params)
    Expense.transaction do
      @income.save!
      @expense.update!(status: "closed")
    end
    @income
  rescue => e
    nil
  end
end
