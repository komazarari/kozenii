class RenameExpensesAdjustedToStatus < ActiveRecord::Migration
  def change
    remove_column :expenses, :adjusted, :boolean
    add_column :expenses, :status, :string, default: "open"
  end
end
