class AddSeasonId < ActiveRecord::Migration
  def change
    add_column :budgets, :season_id, :integer
    add_column :expenses, :season_id, :integer
    add_column :groups, :season_id, :integer
    add_column :incomes, :season_id, :integer
    add_column :members, :season_id, :integer

    add_index :budgets, :season_id
    add_index :expenses, :season_id
    add_index :groups, :season_id
    add_index :incomes, :season_id
    add_index :members, :season_id
  end
end
