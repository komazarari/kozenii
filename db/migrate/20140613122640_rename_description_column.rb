class RenameDescriptionColumn < ActiveRecord::Migration
  def change
    rename_column :incomes, :obtained_by, :description
    rename_column :expenses, :spend_for, :description
  end
end
