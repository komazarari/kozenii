class AddDefalutToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :default_income, :boolean, unique: true
    add_column :budgets, :default_outgoing, :boolean, unique: true
  end
end
