class AddClassToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :section, :string, null: false, default: 'out'
  end
end
