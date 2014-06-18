class AddBudgetIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :budget_id, :integer
    add_column :incomes, :budget_id, :integer
  end
end
